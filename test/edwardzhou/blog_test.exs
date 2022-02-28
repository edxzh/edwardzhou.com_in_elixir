defmodule Edwardzhou.BlogTest do
  use Edwardzhou.DataCase

  alias Edwardzhou.Blog

  describe "posts" do
    alias Edwardzhou.Blog.Post

    import Edwardzhou.BlogFixtures

    @invalid_attrs %{content: nil, publish_status: nil, seo_keyword: nil, title: nil, url_name: nil, uuid: nil, views: nil, weight: nil}

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Blog.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Blog.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      valid_attrs = %{content: "some content", publish_status: :published, seo_keyword: "some seo_keyword", title: "some title", url_name: "some url_name", uuid: "7488a646-e31f-11e4-aace-600308960662", views: 42, weight: 42}

      assert {:ok, %Post{} = post} = Blog.create_post(valid_attrs)
      assert post.content == "some content"
      assert post.publish_status == :published
      assert post.seo_keyword == "some seo_keyword"
      assert post.title == "some title"
      assert post.url_name == "some url_name"
      assert post.uuid == "7488a646-e31f-11e4-aace-600308960662"
      assert post.views == 42
      assert post.weight == 42
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      update_attrs = %{content: "some updated content", publish_status: :drafted, seo_keyword: "some updated seo_keyword", title: "some updated title", url_name: "some updated url_name", uuid: "7488a646-e31f-11e4-aace-600308960668", views: 43, weight: 43}

      assert {:ok, %Post{} = post} = Blog.update_post(post, update_attrs)
      assert post.content == "some updated content"
      assert post.publish_status == :drafted
      assert post.seo_keyword == "some updated seo_keyword"
      assert post.title == "some updated title"
      assert post.url_name == "some updated url_name"
      assert post.uuid == "7488a646-e31f-11e4-aace-600308960668"
      assert post.views == 43
      assert post.weight == 43
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_post(post, @invalid_attrs)
      assert post == Blog.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Blog.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Blog.change_post(post)
    end
  end
end
