defmodule MeowtubeWeb.PageController do
  use MeowtubeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
