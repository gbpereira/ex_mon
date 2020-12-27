defmodule ExMon.Trainer.Pokemon.Update do
  alias Ecto.UUID
  alias ExMon.{Repo, Trainer.Pokemon}

  def call(%{"id" => uuid} = params) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID!"}
      {:ok, _uuid} -> update(params)
    end
  end

  defp update(%{"id" => uuid} = params) do
    case Repo.get(Pokemon, uuid) do
      nil -> {:error, "Pokemon não encontrado!"}
      pokemon -> update_pokemon(pokemon, params)
    end
  end

  defp update_pokemon(pokemon, params) do
    pokemon
    |> Pokemon.update_changeset(params)
    |> Repo.update()
    |> handle()
  end

  defp handle({:ok, pokemon}), do: {:ok, Repo.preload(pokemon, :trainer)}
  defp handle({:error, _err} = error), do: error
end
