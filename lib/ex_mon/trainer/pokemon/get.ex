defmodule ExMon.Trainer.Pokemon.Get do
  alias Ecto.UUID
  alias ExMon.{Repo, Trainer.Pokemon}

  def call(uuid) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID!"}
      {:ok, _uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(Pokemon, uuid) do
      nil -> {:error, "Pokemon não encontrado!"}
      pokemon -> {:ok, Repo.preload(pokemon, :trainer)}
    end
  end
end
