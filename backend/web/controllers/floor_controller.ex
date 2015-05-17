defmodule WeWorkForBeer.FloorController do
  use WeWorkForBeer.Web, :controller

  alias WeWorkForBeer.Floor

  plug :scrub_params, "location" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    floors = Repo.all(Floor)
    render(conn, "index.json", floors: floors)
  end

  def show(conn, %{"id" => id}) do
    floor = Repo.get(Floor, id)
    render conn, "show.json", floor: floor
  end
end
