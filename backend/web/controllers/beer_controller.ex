defmodule WeWorkForBeer.BeerController do
  use WeWorkForBeer.Web, :controller

  alias WeWorkForBeer.Beer

  plug :scrub_params, "beer" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    beers = Repo.all(Beer)
    render(conn, "index.json", beers: beers)
  end

  def create(conn, %{"beer" => beer_params}) do
    changeset = Beer.changeset(%Beer{}, beer_params)

    if changeset.valid? do
      beer = Repo.insert(changeset)
      render(conn, "show.json", beer: beer)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(WeWorkForBeer.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    beer = Repo.get(Beer, id)
    render conn, "show.json", beer: beer
  end
end
