defmodule FoodMonitor.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ecto.Changeset
  alias FoodMonitor.Meals.Meal

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:name, :age, :email, :password]

  @derive {Jason.Encoder, only: [:name, :age, :email]}

  schema "users" do
    field :name, :string
    field :age, :integer
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    has_many :meals, Meal

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_number(:age, greater_than_or_equal_to: 18)
    |> validate_length(:password, min: 6)
    |> unique_constraint([:email])
    |> put_password_hash()
  end

  defp put_password_hash(
    %Changeset{
      valid?: true,
      changes: %{password: password}
    } = changeset), do: change(changeset, Pbkdf2.add_hash(password))

  defp put_password_hash(changeset), do: changeset
end
