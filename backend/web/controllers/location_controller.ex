defmodule WeWorkForBeer.LocationController do
  use WeWorkForBeer.Web, :controller

  alias WeWorkForBeer.Location

  plug :scrub_params, "location" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    locations = Repo.all(Location)
    render(conn, "index.json", locations: locations)
  end

  def create(conn, %{"location" => location_params}) do
    changeset = Location.changeset(%Location{}, location_params)

    if changeset.valid? do
      location = Repo.insert(changeset)
      render(conn, "show.json", location: location)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(WeWorkForBeer.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    location = Repo.get(Location, id)
    render conn, "show.json", location: location
  end

  def update(conn, %{"id" => id, "location" => location_params}) do
    location = Repo.get(Location, id)
    changeset = Location.changeset(location, location_params)

    if changeset.valid? do
      location = Repo.update(changeset)
      render(conn, "show.json", location: location)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(WeWorkForBeer.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    location = Repo.get(Location, id)

    location = Repo.delete(location)
    render(conn, "show.json", location: location)
  end
end
