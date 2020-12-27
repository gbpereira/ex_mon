defmodule ExMon.Trainer do
  use Ecto.Schema
  import Ecto.Changeset

  alias ExMon.Trainer.Pokemon

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @required_params [:name, :password]

  schema "trainers" do
    field :name, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    has_many(:pokemon, Pokemon)
    timestamps()
  end

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params), do: build_changeset(%__MODULE__{}, params)
  def changeset(trainer, params), do: build_changeset(trainer, params)

  def build_changeset(recipient, params) do
    recipient
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:password, min: 6, max: 10)
    |> encrypt_password()
  end

  defp encrypt_password(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  defp encrypt_password(changeset), do: changeset
end
