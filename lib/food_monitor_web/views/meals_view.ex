defmodule FoodMonitorWeb.MealsView do
  use FoodMonitorWeb, :view
  alias FoodMonitor.Meals.Meal

  def render("create.json", %{meal: %Meal{} = meal}) do
    %{
      message: "Meal created",
      meal: meal
    }
  end

  def render("show.json", %{meal: %Meal{} = meal}), do: %{meal: meal}

end
