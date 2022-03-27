defmodule EdwardzhouWeb.Admin.PostListLive do
  use Phoenix.LiveView

  alias Edwardzhou.Blog

  def mount(_params, _session, socket) do
    posts = if connected?(socket), do: Blog.list_posts(), else: []
    assigns = [
      conn: socket,
      posts: posts
    ]

    {:ok, assign(socket, assigns)}
  end

  def render(assigns) do
    EdwardzhouWeb.Admin.PostView.render("posts.html", assigns)
  end
end
