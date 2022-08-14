defmodule TechChallenge.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias TechChallenge.RegExp

  @fields ~w(username email password)a

  schema "users" do
    field :username, :string
    field :email, :string
    field :encrypted_password, :string
    field :password, :string, virtual: true

    #relationships
    #has_many :publications
    #has_many :comments

    timestamps()
  end

  def changeset(user, attrs \\ %{}) do
    user
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end

  def register_changeset(user, attrs) do
    user
    |> cast(attrs, @fields)
    |> validate_required(@fields)
    |> validate_format(:username, RegExp.slug(), message: RegExp.slug_message)
    |> validate_length(:username, max: 40, message: "Max. 40 chars")
    |> validate_format(:email, RegExp.email())
    |> unique_constraint(:username)
    |> validate_length(:password, min: 4)
    |> put_pass_hash()
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :encrypted_password, Pbkdf2.hash_pwd_salt(pass))
      _ ->
        changeset
    end
  end

end
