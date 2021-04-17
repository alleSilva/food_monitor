defmodule FoodMonitor.Meals.Get do
  alias Ecto.UUID
  alias FoodMonitor.Error
  alias FoodMonitor.Meals.Meal
  alias FoodMonitor.Repo

  def by_id(id) do
    case UUID.cast(id) do
      {:ok, uuid} -> get_meal(uuid)
      :error -> {:error, Error.build_id_format_error()}
    end
  end

  defp get_meal(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build(:not_found, "Meal not found")}
      meal -> {:ok, meal}
    end
  end
end
