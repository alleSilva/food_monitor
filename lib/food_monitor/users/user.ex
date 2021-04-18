defmodule FoodMonitor.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ecto.Changeset
  alias FoodMonitor.Meals.Meal

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:name, :cpf, :email]

  @derive {Jason.Encoder, only: [:name, :cpf, :email]}

  schema "users" do
    field :name, :string
    field :cpf, :string
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
    |> validate_length(:cpf, is: 11)
    |> validate_length(:password, min: 6)
    |> validate_format(:email, ~r/\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
    |> unique_constraint([:email])
    |> unique_constraint([:cpf])
    |> put_password_hash()
  end

  defp put_password_hash(
    %Changeset{
      valid?: true,
      changes: %{password: password}
    } = changeset), do: change(changeset, Pbkdf2.add_hash(password))

  defp put_password_hash(changeset), do: changeset
end
