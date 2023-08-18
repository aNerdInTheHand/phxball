defmodule PhxballWeb.Router do
  use PhxballWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {PhxballWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhxballWeb do
    pipe_through :browser

    get "/", PageController, :home

    live "/players", PlayerLive.Index, :index
    live "/players/new", PlayerLive.Index, :new
    live "/players/:id/edit", PlayerLive.Index, :edit

    live "/players/:id", PlayerLive.Show, :show
    live "/players/:id/show/edit", PlayerLive.Show, :edit

    live "/coaches", CoachLive.Index, :index
    live "/coaches/new", CoachLive.Index, :new
    live "/coaches/:id/edit", CoachLive.Index, :edit

    live "/coaches/:id", CoachLive.Show, :show
    live "/coaches/:id/show/edit", CoachLive.Show, :edit

    live "/clubs", ClubLive.Index, :index
    live "/clubs/new", ClubLive.Index, :new
    live "/clubs/:id/edit", ClubLive.Index, :edit

    live "/clubs/:id", ClubLive.Show, :show
    live "/clubs/:id/show/edit", ClubLive.Show, :edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhxballWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:phxball, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: PhxballWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
