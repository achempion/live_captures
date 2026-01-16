defmodule LiveCapturesWeb.PageController do
  use LiveCapturesWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
