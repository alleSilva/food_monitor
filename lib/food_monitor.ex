defmodule FoodMonitor do
  alias FoodMonitor.Meals
  alias Meals.Create, as: CreateMeal
  alias Meals.Get, as: GetMeal
  alias Meals.Delete, as: DeleteMeal
  alias Meals.Update, as: UpdateMeal

  alias FoodMonitor.Users
  alias Users.Create, as: CreateUser
  alias Users.Get, as: GetUser
  alias Users.Delete, as: DeleteUser
  alias Users.Update, as: UpdateUser
  
  defdelegate create_user(params), 
    to: CreateUser, as: :call

  defdelegate get_user_by_id(id), 
    to: GetUser, as: :by_id

  defdelegate delete_user(id),
    to: DeleteUser, as: :call

  defdelegate update_user(params),
    to: UpdateUser, as: :call

  defdelegate create_meal(params),
    to: CreateMeal, as: :call                   
  defdelegate get_meal_by_id(id),
    to: GetMeal, as: :by_id

  defdelegate delete_meal(id),
    to: DeleteMeal, as: :call

  defdelegate update_meal(params),
    to: UpdateMeal, as: :call
end
