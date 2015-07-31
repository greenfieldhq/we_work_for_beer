defmodule WeWorkForBeer.BeerController do
  import Ecto.Query
  use WeWorkForBeer.Web, :controller

  alias WeWorkForBeer.Beer

  def index(conn, %{"query" => query}) do
    beers =
      from(b in Beer, limit: 20)
      |> Beer.search(query)
      |> Repo.all

    render(conn, "index.json", beers: beers)
  end

  def index(conn, _params) do
    beers = from(b in Beer, limit: 20) |> Repo.all
    render(conn, "index.json", beers: beers)
  end

  def create(conn, %{"beer" => beer_params}) do
    changeset = Beer.changeset(%Beer{}, beer_params)

    if changeset.valid? do
      beer = Repo.insert!(changeset)
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
