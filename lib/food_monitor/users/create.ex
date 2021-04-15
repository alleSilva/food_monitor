defmodule FoodMonitor.Users.Create do
  alias FoodMonitor.Error
  alias FoodMonitor.Users.User
  alias FoodMonitor.Repo
  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %User{} = result}), do: {:ok, result}

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
