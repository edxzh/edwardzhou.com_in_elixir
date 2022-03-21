defmodule Edwardzhou.Blog do
  @moduledoc """
  The Blog context.
  """

  import Ecto.Query, warn: false
  alias Edwardzhou.Repo

  alias Edwardzhou.Blog.Post
  alias Edwardzhou.Blog.Tag

  @doc """
  Returns the list of posts.

  ## Examples

      iex> list_posts()
      [%Post{}, ...]

  """
  def list_posts do
    Post
    |> Repo.all()
  end

  def paginate_posts(params \\ []) do
    Post
    |> Repo.paginate(params)
  end

  def count_posts do
    Repo.aggregate(Post, :count, :id)
  end

  @doc """
  Gets a single post.

  Raises if the Post does not exist.

  ## Examples

      iex> get_post!(123)
      %Post{}

  """
  def get_post!(id), do: raise("TODO")

  @doc """
  Creates a post.

  ## Examples

      iex> create_post(%{field: value})
      {:ok, %Post{}}

      iex> create_post(%{field: bad_value})
      {:error, ...}

  """
  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a post.

  ## Examples

      iex> update_post(post, %{field: new_value})
      {:ok, %Post{}}

      iex> update_post(post, %{field: bad_value})
      {:error, ...}

  """
  def update_post(%Post{} = post, attrs) do
    raise "TODO"
  end

  @doc """
  Deletes a Post.

  ## Examples

      iex> delete_post(post)
      {:ok, %Post{}}

      iex> delete_post(post)
      {:error, ...}

  """
  def delete_post(%Post{} = post) do
    raise "TODO"
  end

  @doc """
  Returns a data structure for tracking post changes.

  ## Examples

      iex> change_post(post)
      %Todo{...}

  """
  def change_post(%Post{} = post, _attrs \\ %{}) do
    Post.changeset(post, %{})
  end

  def count_tag do
    Repo.aggregate(Tag, :count, :id)
  end

  def list_tags do
    Tag
    |> Repo.all()
  end
end
