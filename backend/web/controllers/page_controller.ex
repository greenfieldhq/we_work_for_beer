defmodule WeWorkForBeer.PageController do
  use WeWorkForBeer.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
