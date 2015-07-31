defmodule WeWorkForBeer.FloorController do
  use WeWorkForBeer.Web, :controller

  alias WeWorkForBeer.Floor

  plug :action

  def index(conn, _params) do
    floors = Repo.all(from f in Floor, preload: [:floor_beers, :beers])
    render(conn, "index.json", floors: floors)
  end

  def show(conn, %{"id" => id}) do
    floor = Repo.one(from f in Floor, where: f.id == ^id, preload: [:beers])
    render conn, "show.json", floor: floor
  end
end
