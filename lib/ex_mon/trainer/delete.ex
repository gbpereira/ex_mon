defmodule ExMon.Trainer.Delete do
  alias Ecto.UUID
  alias ExMon.{Repo, Trainer}

  def call(uuid) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID!"}
      {:ok, _uuid} -> delete(uuid)
    end
  end

  defp delete(uuid) do
    case Repo.get(Trainer, uuid) do
      nil -> {:error, "Trainer não encontrado!"}
      trainer -> Repo.delete(trainer)
    end
  end
end
