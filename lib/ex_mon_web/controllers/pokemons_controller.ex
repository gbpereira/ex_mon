defmodule ExMonWeb.PokemonsController do
  use ExMonWeb, :controller

  action_fallback ExMonWeb.FallbackController

  def show(conn, %{"name" => name}) do
    name
    |> ExMon.fetch_pokemon()
    |> handle_response(conn)
  end

  defp handle_response({:ok, pokemon}, conn) do
    conn
    |> put_status(:ok)
    |> json(pokemon)
  end

  defp handle_response({:error, %{status: :not_found}} = _error, conn) do
    conn
    |> put_status(:not_found)
    |> text("")
  end

  defp handle_response({:error, _reason} = error, _conn), do: error
end
