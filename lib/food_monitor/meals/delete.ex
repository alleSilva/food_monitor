defmodule FoodMonitor.Meals.Delete do
  alias Ecto.UUID
  alias FoodMonitor.Error
  alias FoodMonitor.Meals.Meal
  alias FoodMonitor.Repo

  def call(id) do
    case UUID.cast(id) do
      {:ok, uuid} -> get_meal(uuid)
      :error -> {:error, Error.build_id_format_error()}
    end
  end

  defp get_meal(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      meal -> Repo.delete(meal)
    end
  end
end
