defmodule BlogWeb.UserController do
  use BlogWeb, :controller

  def index(conn, _params) do
    users = Blog.Users.get_users()
    render(conn, "index.html", users: users)
  end

  def show(conn, %{"id" => id}) do
    user = Blog.Users.get_user(id)
    render(conn, "show.html", user: user)
  end

  def new(conn, _params) do
    changeset = Blog.Users.change_user(%Blog.Users.User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Blog.Users.create_user(user_params) do
      {:ok, user} ->
        render(conn, "show.html", user: user)

      {:error, changeset} ->
        conn
        |> put_flash(:error, "You did bad")
        |> render("new.html", changeset: changeset)
    end
  end
end
