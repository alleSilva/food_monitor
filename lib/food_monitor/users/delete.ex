defmodule FoodMonitor.Users.Delete do
  alias Ecto.UUID
  alias FoodMonitor.Error
  alias FoodMonitor.Users.User
  alias FoodMonitor.Repo

  def call(id) do
    case UUID.cast(id) do
      {:ok, uuid} -> get_user(uuid)
      :error -> {:error, Error.build_id_format_error()}
    end
  end

  defp get_user(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> Repo.delete(user)
    end
  end
end
