defmodule LiveCapturesWeb.CaptureTest do
  use LiveCapturesWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  test "the dashboard capture mounts with a component preview", %{conn: conn} do
    path = "/phoenix_live_dashboard/components/Elixir.Phoenix.LiveDashboard.HomePage/render"
    {:ok, view, _html} = live(conn, path)

    assert has_element?(
             view,
             "#live-capture-frame[src^='/phoenix_live_dashboard/raw/components/Elixir.Phoenix.LiveDashboard.HomePage/render']"
           )
  end
end
