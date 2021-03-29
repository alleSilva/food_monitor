defmodule FoodMonitor.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_id {:id, :binary_id, autogenerate: true}
  @required_params [:description, :date, :calories]

  schema "meals" do
    field :description, :string
    field :date, :naive_datetime
    field :calories, :decimal

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end