defmodule FoodMonitorWeb.MealsController do
  use FoodMonitorWeb, :controller
  alias FoodMonitor.Meals.Meal
  alias FoodMonitorWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Meal{} = meal} <- FoodMonitor.create_meal(params) do
      conn
      |> put_status(:created)
      |> render("create.json", meal: meal)
    end
  end

  def update(conn, params) do
    with {:ok, %Meal{} = meal} <- FoodMonitor.update_meal(params) do
      conn
      |> put_status(:ok)
      |> render("show.json", meal: meal)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Meal{} = meal} <- FoodMonitor.get_meal_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("show.json", meal: meal)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Meal{}} <- FoodMonitor.delete_meal(id) do
      conn
      |> put_status(:no_content)
      |> text("")
      end
  end
end
