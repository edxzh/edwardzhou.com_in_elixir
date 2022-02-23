defmodule Edwardzhou.Repo.Migrations.CreateTags do
  use Ecto.Migration

  def change do
    create table(:tags) do
      add :name, :string, null: false, comment: "tag name"
      add :publish_status, :string, default: "drafted"
      add :uuid, :uuid

      timestamps()
    end

    create unique_index(:tags, [:name])
  end
end
