defmodule TechChallenge.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  alias TechChallenge.RegExp
  alias TechChallenge.Users.User
  alias TechChallenge.Posts.Category
  alias TechChallenge.Posts.Comment


  @fields ~w(title description image anonymouns user_id category1_id category2_id)a

  schema "posts" do
    field :image, :string
    field :anonymouns, :boolean, default: false
    field :description, :string
    field :title, :string

    #relationships
    belongs_to :user, User
    belongs_to :category1, Category
    belongs_to :category2, Category

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
