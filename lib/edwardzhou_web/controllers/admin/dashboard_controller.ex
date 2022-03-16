defmodule EdwardzhouWeb.Admin.DashboardController do
  use EdwardzhouWeb, :controller

  alias Edwardzhou.Blog
  alias Edwardzhou.Blog.{Post, Tag}

  def index(conn, _params) do
    post_count = Blog.count_posts()
    tag_count = Blog.count_tag()
    render(conn, "index.html", post_count: post_count, tag_count: tag_count, page: :dashboard)
  end
end
