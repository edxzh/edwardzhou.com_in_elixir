defmodule Edwardzhou.Blog.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field :name, :string
    field :publish_status, Ecto.Enum, values: [:published, :drafted, :deleted]
    field :uuid, Ecto.UUID

    many_to_many :posts, Edwardzhou.Blog.Post, join_through: "posts_tags"

    timestamps()
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:name, :publish_status, :uuid])
    |> validate_required([:name, :publish_status, :uuid])
    |> unique_constraint(:name)
  end
end
