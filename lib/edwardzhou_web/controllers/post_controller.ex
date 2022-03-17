defmodule EdwardzhouWeb.PostController do
  use EdwardzhouWeb, :controller

  alias Edwardzhou.Blog
  alias Edwardzhou.Blog.Post

  def index(conn, _params) do
    posts = Blog.list_posts()
    render(conn, "index.html", posts: posts, page: :posts)
  end

  def show(conn, %{"id" => id}) do
    post = Blog.get_post!(id)
    render(conn, "show.html", post: post)
  end
end
