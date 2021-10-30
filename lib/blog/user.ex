defmodule Blog.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :username, :string
    field :email, :string

    timestamps()
  end

  def changeset(user, params) do
    user
    |> cast(params, [:username, :email])
    |> validate_required([:username, :email])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:username, min: 3)
    |> unique_constraint([:username, :email])
  end
end
