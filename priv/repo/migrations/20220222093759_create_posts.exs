defmodule Edwardzhou.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string, null: false
      add :content, :text, null: false
      add :views, :integer, default: 0, comment: "the number of visits"
      add :weight, :integer, default: 0
      add :seo_keyword, :string
      add :url_name, :string, null: false, comment: "in the url path"
      add :publish_status, :string, default: "drafted"
      add :uuid, :uuid

      timestamps()
    end

    create unique_index(:posts, [:url_name])
    create unique_index(:posts, [:title])
  end
end
