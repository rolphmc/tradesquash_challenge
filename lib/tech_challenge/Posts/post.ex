defmodule TechChallenge.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  alias TechChallenge.RegExp
  alias TechChallenge.Users.User
  alias TechChallenge.Posts.Comment


  @fields ~w(title description image anonymouns category1 category2)a #user_id category1_id category2_id

  schema "posts" do
    field :image, :string
    field :anonymouns, :boolean, default: false
    field :description, :string
    field :title, :string
    field :categories, :string, virtual: true
    field :category1, :integer
    field :category2, :integer

    #relationships
    belongs_to :user, User


    has_many :comments, Comment

    timestamps()
  end

  def changeset(post, params \\ %{}) do
    post
    |> cast(params, @fields)
    |> validate_required(@fields)
  end

  def insert_changeset(post, params \\ %{}) do
    post
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_format(:image, RegExp.http, mensage: RegExp.http_message)
  end
end
