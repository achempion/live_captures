defmodule LiveCapturesWeb.PageController do
  use LiveCapturesWeb, :controller

  def home(conn, _params) do
    render(conn, :home,
      page_title: "LiveCaptures - LiveView capture examples",
      page_description:
        "Explore LiveCapture demos for Phoenix LiveView components and see how visual capture improves UI quality."
    )
  end
end
