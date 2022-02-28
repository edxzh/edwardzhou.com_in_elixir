defmodule Edwardzhou.BlogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Edwardzhou.Blog` context.
  """

  @doc """
  Generate a unique post title.
  """
  def unique_post_title, do: "some title#{System.unique_integer([:positive])}"

  @doc """
  Generate a unique post url_name.
  """
  def unique_post_url_name, do: "some url_name#{System.unique_integer([:positive])}"

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        content: "some content",
        publish_status: :published,
        seo_keyword: "some seo_keyword",
        title: unique_post_title(),
        url_name: unique_post_url_name(),
        uuid: "7488a646-e31f-11e4-aace-600308960662",
        views: 42,
        weight: 42
      })
      |> Edwardzhou.Blog.create_post()

    post
  end
end
