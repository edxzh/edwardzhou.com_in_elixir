defmodule EdwardzhouWeb.PageController do
  use EdwardzhouWeb, :controller

  def home(conn, _params) do
    render(conn, "home.html", page: :home)
  end

  def about(conn, _params) do
    render(conn, "about.html", page: :about)
  end
end
