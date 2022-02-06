defmodule EdwardzhouWeb.PageController do
  use EdwardzhouWeb, :controller

  def home(conn, _params) do
    render(conn, "home.html")
  end
end
