defmodule TechChallengeWeb.CommentsControllerTest do
  use TechChallengeWeb.ConnCase

  test "GET /comments", %{conn: conn} do
    conn = get(conn, "/comments")
    assert html_response(conn, 200) =~ "<h2>Discuss</h2>"
  end

end
