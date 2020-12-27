defmodule ExMon.Trainer.Update do
  alias Ecto.UUID
  alias ExMon.{Repo, Trainer}

  def call(%{"id" => uuid} = params) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID!"}
      {:ok, _uuid} -> update(params)
    end
  end

  defp update(%{"id" => uuid} = params) do
    case Repo.get(Trainer, uuid) do
      nil -> {:error, "Trainer não encontrado!"}
      trainer -> update_trainer(trainer, params)
    end
  end

  defp update_trainer(trainer, params) do
    trainer
    |> Trainer.changeset(params)
    |> Repo.update()
  end
end
