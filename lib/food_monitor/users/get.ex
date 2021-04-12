defmodule FoodMonitor.Users.Delete do
  alias Ecto.UUID
  alias FoodMonitor.Error
  alias FoodMonitor.Users.User
  alias FoodMonitor.Repo

  def get_by_id(id) do
    case UUID.cast(id) do
      {:ok, uuid} -> delete_user(uuid)
      :error -> {:error, Error.build_id_format_error()}
    end
  end

  defp delete_user(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> {:ok, user}
    end
  end
end
