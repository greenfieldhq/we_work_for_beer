defmodule WeWorkForBeer.LocationController do
  use WeWorkForBeer.Web, :controller

  alias WeWorkForBeer.Location

  plug :scrub_params, "location" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    locations = Repo.all(Location)
    render(conn, "index.json", locations: locations)
  end

  def show(conn, %{"id" => id}) do
    location = Repo.get(Location, id)
    render conn, "show.json", location: location
  end
end
