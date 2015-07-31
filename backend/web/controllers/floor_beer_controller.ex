defmodule WeWorkForBeer.FloorBeerController do
  import Ecto.Query
  use WeWorkForBeer.Web, :controller

  alias WeWorkForBeer.FloorBeer

  plug :action

  def create(conn, %{"floor_beer" => floor_beer_params}) do
    changeset = FloorBeer.changeset(%FloorBeer{}, floor_beer_params)

    if changeset.valid? do
      floor_beer = Repo.insert!(changeset)
      render(conn, "show.json", floor_beer: floor_beer)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(WeWorkForBeer.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def update(conn, %{"id" => id, "floor_beer" => %{"tapped" => tapped}}) do
    floor_beer = Repo.get(FloorBeer, id)
    changeset = FloorBeer.changeset(floor_beer, %{tapped: tapped})

    if changeset.valid? do
      floor_beer = Repo.update(changeset)
      render(conn, "show.json", floor_beer: floor_beer)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(WeWorkForBeer.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
