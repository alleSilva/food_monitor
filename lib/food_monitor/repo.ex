defmodule FoodMonitor.Repo do
  use Ecto.Repo,
    otp_app: :food_monitor,
    adapter: Ecto.Adapters.Postgres
end
