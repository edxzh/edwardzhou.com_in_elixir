defmodule Edwardzhou.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :content, :string
    field :publish_status, Ecto.Enum, values: [:drafted, :published, :deleted]
    field :seo_keyword, :string
    field :title, :string, unique: true
    field :url_name, :string, unique: true
    field :uuid, Ecto.UUID
    field :views, :integer, default: 0
    field :weight, :integer, default: 0

    many_to_many :tags, Edwardzhou.Blog.Tag, join_through: "posts_tags"

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :content, :views, :weight, :seo_keyword, :url_name, :publish_status])
    |> validate_required([
      :title,
      :content,
      :weight,
      :seo_keyword,
      :url_name,
      :publish_status
    ])
    |> unique_constraint(:url_name)
    |> unique_constraint(:title)
  end
end
