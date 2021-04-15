defmodule FoodMonitorWeb.UsersController do
  use FoodMonitorWeb, :controller
  alias FoodMonitor.Users.User
  alias FoodMonitorWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- FoodMonitor.create_user(params) do
      conn
      |> put_status(:created)
      |> render("user.json", user: user)
    end
  end
end
