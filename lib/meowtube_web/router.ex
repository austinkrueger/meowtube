defmodule MeowtubeWeb.Router do
  use MeowtubeWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Meowtube.Plugs.SetUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug MeowtubeWeb.Plugs.RequireAuth
  end

  scope "/", MeowtubeWeb do
    pipe_through [:browser, :auth]

    resources "/videos", VideoController, only: [:new, :create, :delete]
  end

  scope "/", MeowtubeWeb do
    pipe_through :browser

    resources "/videos", VideoController, only: [:index, :show]
    get "/", PageController, :index
  end

  scope "/auth", MeowtubeWeb do
    pipe_through :browser

    get "/signout", SessionController, :delete
    get "/:provider", SessionController, :request
    get "/:provider/callback", SessionController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", MeowtubeWeb do
  #   pipe_through :api
  # end
end
