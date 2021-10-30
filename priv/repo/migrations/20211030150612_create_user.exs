defmodule Blog.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table("users") do
      add :username, :string
      add :email, :string

      timestamps()
    end

    create index("users", [:username, :email])
  end
end
