defmodule Blog.Users do
  alias Blog.Users.User

  def get_users() do
    Blog.Repo.all(User)
  end

  def get_user(id) do
    Blog.Repo.get(User, id)
  end

  def change_user(user) do
    User.changeset(user, %{})
  end

  def create_user(params) do
    User.changeset(%User{}, params)
    |> Blog.Repo.insert()
  end
end
