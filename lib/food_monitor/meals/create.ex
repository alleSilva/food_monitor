defmodule FoodMonitor.Meals.Create do
  alias FoodMonitor.Error
  alias FoodMonitor.Meals.Meal
  alias FoodMonitor.Repo
  def call(params) do
    params
    |> Meal.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Meal{} = result}), do: {:ok, result}

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
