defmodule ExMon.Trainer.Pokemon.Delete do
  alias Ecto.UUID
  alias ExMon.{Repo, Trainer.Pokemon}

  def call(uuid) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID!"}
      {:ok, _uuid} -> delete(uuid)
    end
  end

  defp delete(uuid) do
    case Repo.get(Pokemon, uuid) do
      nil -> {:error, "Pokemon não encontrado!"}
      trainer -> Repo.delete(trainer)
    end
  end
end
