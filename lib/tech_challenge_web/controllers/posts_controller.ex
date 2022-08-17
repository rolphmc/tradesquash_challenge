defmodule TechChallengeWeb.PostsController do
  use TechChallengeWeb, :controller

#  alias TechChallenge.Posts
  alias TechChallenge.Posts.Post

  def new(conn, _params) do
    changeset = Post.changeset(%Post{})
    render(conn, "new.html", changeset: changeset)
  end

#  def create(conn, %{"post" => post_params}) do
#    case Posts.create_post(conn.assigns.current_user, post_params) do
#      {:ok, post} ->
#        conn
#        |> put_flash(:info, "Post #{post.title} created successfully.")
#        |> redirect(to: Routes.page_path(conn, :index))
#      {:error, %Ecto.Changeset{} = changeset} ->
#      render(conn, "new.html", changeset: changeset)
#    end
#  end

end
