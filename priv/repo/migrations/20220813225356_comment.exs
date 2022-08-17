defmodule TechChallenge.Repo.Migrations.Comment do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :content, :text, null: false
      add :anonymouns, :boolean
      add :user_id, references(:users)
      add :post_id, references(:posts)

      timestamps()
    end
  end
end
