defmodule LiveCapturesWeb.PageController do
  use LiveCapturesWeb, :controller

  def home(conn, _params) do
    render(conn, :home,
      page_title: "LiveCaptures - LiveView capture examples",
      page_description: "LiveCapture helps you create high-quality LiveView components faster."
    )
  end
end
