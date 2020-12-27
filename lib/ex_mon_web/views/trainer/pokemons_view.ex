defmodule ExMonWeb.Trainer.PokemonsView do
  use ExMonWeb, :view

  alias ExMon.Trainer.Pokemon

  def render("create.json", %{
        pokemon: %Pokemon{
          id: id,
          name: name,
          nickname: nickname,
          types: types,
          weight: weight,
          trainer: %{id: trainer_id, name: trainer_name},
          inserted_at: inserted_at
        }
      }) do
    %{
      message: "Pokemon criado!",
      pokemon: %{
        id: id,
        name: name,
        nickname: nickname,
        types: types,
        weight: weight,
        trainer: %{id: trainer_id, name: trainer_name},
        inserted_at: inserted_at
      }
    }
  end

  def render("show.json", %{
        pokemon: %Pokemon{
          id: id,
          name: name,
          nickname: nickname,
          types: types,
          weight: weight,
          trainer: %{id: trainer_id, name: trainer_name},
          inserted_at: inserted_at
        }
      }) do
    %{
      id: id,
      name: name,
      nickname: nickname,
      types: types,
      weight: weight,
      trainer: %{id: trainer_id, name: trainer_name},
      inserted_at: inserted_at
    }
  end

  def render("update.json", %{
        pokemon: %Pokemon{
          id: id,
          name: name,
          nickname: nickname,
          types: types,
          weight: weight,
          trainer: %{id: trainer_id, name: trainer_name},
          inserted_at: inserted_at
        }
      }) do
    %{
      message: "Pokemon atualizado!",
      pokemon: %{
        id: id,
        name: name,
        nickname: nickname,
        types: types,
        weight: weight,
        trainer: %{id: trainer_id, name: trainer_name},
        inserted_at: inserted_at
      }
    }
  end
end
