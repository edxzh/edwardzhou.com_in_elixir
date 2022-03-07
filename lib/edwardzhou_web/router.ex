defmodule EdwardzhouWeb.Router do
  use EdwardzhouWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :root_layout do
    plug :put_root_layout, {EdwardzhouWeb.LayoutView, :root}
  end

  pipeline :admin_layout do
    plug :put_layout, { EdwardzhouWeb.LayoutView, :admin }
  end

  scope "/", EdwardzhouWeb do
    pipe_through [:browser, :root_layout]

    resources "/posts", PostController
    get "/", PageController, :home
    get "/about", PageController, :about
  end

  scope "/admin", EdwardzhouWeb.Admin, as: :admin do
    pipe_through [:browser, :admin_layout]

    resources "/posts", PostController
  end

  # Other scopes may use custom stacks.
  # scope "/api", EdwardzhouWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: EdwardzhouWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
