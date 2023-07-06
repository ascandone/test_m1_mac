defmodule TestM1MacWeb.Router do
  use TestM1MacWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TestM1MacWeb do
    pipe_through :api

    get "/", Controller, :index
  end

  scope "/api", TestM1MacWeb do
    pipe_through :api
  end

  # Enable LiveDashboard in development
  if Application.compile_env(:test_m1_mac, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: TestM1MacWeb.Telemetry
    end
  end
end
