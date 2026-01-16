defmodule LiveCapturesWeb.PageControllerTest do
  use LiveCapturesWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/")
    html = html_response(conn, 200)
    assert html =~ "live-capture-hero"
    assert html =~ "Explore components"
  end
end
