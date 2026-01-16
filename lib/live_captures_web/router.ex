defmodule LiveCapturesWeb.Router do
  use LiveCapturesWeb, :router

  import LiveCapture.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {LiveCapturesWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LiveCapturesWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

  scope "/" do
    pipe_through :browser

    live_capture "/phoenix_live_dashboard", Phoenix.LiveDashboard.LiveCapture,
      csp_nonce_assign_key: %{
        style: :style_csp_nonce,
        script: :script_csp_nonce
      }
  end

  # Other scopes may use custom stacks.
  # scope "/api", LiveCapturesWeb do
  #   pipe_through :api
  # end
end
