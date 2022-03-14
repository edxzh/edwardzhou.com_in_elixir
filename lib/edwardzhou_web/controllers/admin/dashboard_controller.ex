defmodule EdwardzhouWeb.Admin.DashboardController do
  use EdwardzhouWeb, :controller

  alias Edwardzhou.Blog
  alias Edwardzhou.Blog.Post

  def index(conn, _params) do
    render(conn, "index.html", page: :dashboard)
  end
end
