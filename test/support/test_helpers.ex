defmodule TechChallenge.TestHelpers do

  alias TechChallenge.Users

  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        username: "admin",
        email: "admin@admin.com",
        password: attrs[:password] || "supersecret"
      })
      |> Users.register_user()
    user
  end
end
