defmodule WeWorkForBeer.BeerControllerTest do
  use WeWorkForBeer.ConnCase

  alias WeWorkForBeer.Beer
  @valid_attrs %{
    abv: 12.3,
    description: "gittin' drunk",
    name: "Drunk Guy Ale",
    style: "some content",
    uid: "some content"
  }
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    beer1 = Beer.changeset(%Beer{}, Map.put(@valid_attrs, :uid, "123"))
    |> Repo.insert
    beer2 = Beer.changeset(%Beer{}, Map.put(@valid_attrs, :uid, "456"))
    |> Repo.insert

    conn = get conn, beer_path(conn, :index)

    assert json_response(conn, 200)["beers"] == [
      %{
        "id" => beer1.id,
        "name" => beer1.name,
        "style" => beer1.style,
        "abv" => to_string(beer1.abv),
        "description" => beer1.description,
      },
      %{
        "id" => beer2.id,
        "name" => beer2.name,
        "style" => beer2.style,
        "abv" => to_string(beer2.abv),
        "description" => beer2.description
      }
    ]
  end

  test "shows chosen resource", %{conn: conn} do
    beer = Repo.insert Beer.changeset(%Beer{}, @valid_attrs)
    conn = get conn, beer_path(conn, :show, beer)
    assert json_response(conn, 200)["beer"] == %{
      "id" => beer.id,
      "name" => beer.name,
      "style" => beer.style,
      "abv" => to_string(beer.abv),
      "description" => beer.description
    }
  end
end
