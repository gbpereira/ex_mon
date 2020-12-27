defmodule ExMon.Trainer.Pokemon do
  use Ecto.Schema

  import Ecto.Changeset

  alias ExMon.Trainer

  # @keys [:id, :name]

  # @enforce_keys @keys

  @derive Jason.Encoder
  # defstruct @keys

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  @required_params [:name, :nickname, :weight, :types, :trainer_id]

  schema "pokemons" do
    field :name, :string
    field :nickname, :string
    field :weight, :integer
    field :types, {:array, :string}
    belongs_to(:trainer, Trainer)
    timestamps()
  end

  def build(params) do
    params
    |> create_changeset()
    |> apply_action(:insert)
  end

  def create_changeset(params), do: create_build_changeset(%__MODULE__{}, params)
  def create_changeset(trainer, params), do: create_build_changeset(trainer, params)

  def create_build_changeset(recipient, params) do
    recipient
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> assoc_constraint(:trainer)
    |> validate_length(:nickname, min: 4)
  end

  def update_changeset(pokemon, params) do
    pokemon
    |> cast(params, [:nickname])
    |> validate_required([:nickname])
    |> validate_length(:nickname, min: 4)
  end
end
