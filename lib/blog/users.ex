defmodule Blog.Users do
  def get_users() do
    Blog.Repo.all(Blog.Users.User)
  end
end
