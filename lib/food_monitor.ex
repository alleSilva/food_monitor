defmodule FoodMonitor do
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
end
