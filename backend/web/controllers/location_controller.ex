defmodule WeWorkForBeer.LocationController do
  use WeWorkForBeer.Web, :controller
  alias WeWorkForBeer.Location

  plug :action

  def index(conn, _params) do
    locations = Repo.all(Location)
    render conn, locations: locations
  end

  def show(conn, %{"id" => id}) do
    location = Repo.get(Location, id)
    render conn, location: location
  end
end
