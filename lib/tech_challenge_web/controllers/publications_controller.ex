defmodule TechChallengeWeb.PublicationsController do
  use TechChallengeWeb, :controller

  def index(conn, _params) do
    render(conn, "new.html")
  end
end
