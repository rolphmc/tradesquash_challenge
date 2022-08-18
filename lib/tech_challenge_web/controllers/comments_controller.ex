defmodule TechChallengeWeb.CommentsController do
  use TechChallengeWeb, :controller

  alias TechChallenge.Posts
  alias TechChallenge.Posts.Comment


  def show(conn, %{"id" => id}) do
    post = Posts.get_post!(id)
    user = post.user.username
    comments = post.comments
    changeset = Posts.change_comments(%Comment{})

    render(conn, "show.html", post: post, user: user, comments: comments, changeset: changeset)
  end

  def create(conn, %{"post" => post_params}, %{"comment" => comment_params}) do
    case Posts.create_comment(conn.assigns.current_user, post_params, comment_params) do
      {:ok, _comment} ->
        conn
        |> put_flash(:info, "Your Comment created successfully.")
        |> redirect(to: Routes.comments_path(:show, post_params.id))
      {:error, %Ecto.Changeset{} = changeset} ->
      render(conn, "new.html", changeset: changeset)
    end
  end
end
