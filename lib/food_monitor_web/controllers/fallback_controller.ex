defmodule FoodMonitorWeb.FallbackController do
  use FoodMonitorWeb, :controller
  alias FoodMonitorWeb.ErrorView

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ErrorView)
    |> render("400.json", result: result)
  end
end
