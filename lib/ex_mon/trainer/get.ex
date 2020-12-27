defmodule ExMon.Trainer.Get do
  alias Ecto.UUID
  alias ExMon.{Repo, Trainer}

  def call(uuid) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID!"}
      {:ok, _uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(Trainer, uuid) do
      nil -> {:error, "Trainer não encontrado!"}
      trainer -> {:ok, trainer}
    end
  end
end
