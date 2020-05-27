defmodule MeowtubeWeb.PageControllerTest do
  use MeowtubeWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Meowtube!"
  end
end
