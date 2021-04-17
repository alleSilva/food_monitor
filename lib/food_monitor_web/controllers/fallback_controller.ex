defmodule FoodMonitorWeb.FallbackController do
  use FoodMonitorWeb, :controller
  alias FoodMonitor.Error
  alias FoodMonitorWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
