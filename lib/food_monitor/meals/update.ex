defmodule FoodMonitor.Meals.Update do
  alias Ecto.UUID
  alias FoodMonitor.Error
  alias FoodMonitor.Meals.Meal
  alias FoodMonitor.Repo

  def call(%{"id" => id} = params) do
    case UUID.cast(id) do
      :error -> {:error, Error.build_id_format_error()}
      {:ok, _uuid} -> update(params)
    end
  end

  defp update(%{"id" => id} = params) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> do_update(user, params)
    end
  end

  defp do_update(user, params) do
    user
    |>Meal.changeset(params)
    |> Repo.update()
  end
end
