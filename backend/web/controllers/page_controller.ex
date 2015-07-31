defmodule WeWorkForBeer.PageController do
  use WeWorkForBeer.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
