defmodule BlogWeb.UserController do
  use BlogWeb, :controller

  def index(conn, _params) do
    users = Blog.Users.get_users()
    render(conn, "index.html", users: users)
  end
end
