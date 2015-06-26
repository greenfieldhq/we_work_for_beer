defmodule WeWorkForBeer.FloorBeerController do
  import Ecto.Query
  use WeWorkForBeer.Web, :controller

  alias WeWorkForBeer.FloorBeer

  plug :scrub_params, "floor_beer" when action in [:create]
  plug :action

  def create(conn, %{"floor_beer" => floor_beer_params}) do
    changeset = FloorBeer.changeset(%FloorBeer{}, floor_beer_params)

    if changeset.valid? do
      floor_beer = Repo.insert(changeset)
      render(conn, "show.json", floor_beer: floor_beer)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(WeWorkForBeer.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
