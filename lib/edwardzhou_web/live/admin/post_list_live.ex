defmodule EdwardzhouWeb.Admin.PostListLive do
  use Phoenix.LiveView, layout: { EdwardzhouWeb.LayoutView, "admin.html"}

  alias EdwardzhouWeb.Router.Helpers, as: Routes
  alias Edwardzhou.Blog
  alias EdwardzhouWeb.Admin.PostListLive

  def mount(_params, _session, socket) do
    {:ok, assign(socket, conn: socket)}
  end

  def render(assigns) do
    EdwardzhouWeb.Admin.PostView.render("posts.html", assigns)
  end

  def handle_event("nav", %{"page" => page}, socket) do
    {:noreply, live_patch(socket, to: Routes.admin_live_path(socket, PostListLive, page: page))}
  end

  def handle_params(%{"page" => page}, _, socket) do
    assigns = get_and_assign_page(page)
    {:noreply, assign(socket, assigns)}
  end

  def handle_params(_, _, socket) do
    assigns = get_and_assign_page(3)
    {:noreply, assign(socket, assigns)}
  end

  def get_and_assign_page(page_number) do
    %{
      entries: entries,
      page_number: page_number,
      page_size: page_size,
      total_entries: total_entries,
      total_pages: total_pages
    } = Blog.paginate_posts(page: page_number)

    [
      page: :post,
      posts: entries,
      page_number: page_number,
      page_size: page_size,
      total_entries: total_entries,
      total_pages: total_pages
    ]
  end
end
