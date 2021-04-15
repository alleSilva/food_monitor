defmodule FoodMonitorWeb.UsersView do
  use FoodMonitorWeb, :view
  alias FoodMonitor.Users.User

  def render("user.json", %{user: %User{} = user}) do
    %{
      message: "User created",
      user: user
    }
  end
end
