defmodule TechChallenge.Repo.Migrations.Posts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :image, :string
      add :anonymouns, :boolean
      add :description, :text, null: false
      add :title, :string, null: false
      add :category1_id, references(:categories)
      add :category2_id, references(:categories)
      add :user_id, references(:users)

      timestamps()
    end

    create unique_index(:posts, [:title])
  end
end
