defmodule WeWorkForBeer.BeerControllerTest do
  use WeWorkForBeer.ConnCase

  alias WeWorkForBeer.Beer
  @valid_attrs %{
    abv: 12.3,
    description: "gittin' drunk",
    name: "Drunk Guy Ale",
    style: "some content",
    uid: "some content",
    brewery_name: "Sofa King Good Beer",
    icon_small: "small.png",
    icon_medium: "medium.png",
    icon_large: "large.png"
  }
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    beer1 = Beer.changeset(%Beer{}, Map.put(@valid_attrs, :uid, "123"))
    |> Repo.insert!
    beer2 = Beer.changeset(%Beer{}, Map.put(@valid_attrs, :uid, "456"))
    |> Repo.insert!

    conn = get conn, beer_path(conn, :index)

    assert json_response(conn, 200)["beers"] == [
      %{
        "id" => beer1.id,
        "name" => beer1.name,
        "style" => beer1.style,
        "abv" => to_string(beer1.abv),
        "description" => beer1.description,
        "brewery_name" => beer1.brewery_name,
        "icon_small" => beer1.icon_small,
        "icon_medium" => beer1.icon_medium,
        "icon_large" => beer1.icon_large
      },
      %{
        "id" => beer2.id,
        "name" => beer2.name,
        "style" => beer2.style,
        "abv" => to_string(beer2.abv),
        "description" => beer2.description,
        "brewery_name" => beer2.brewery_name,
        "icon_small" => beer2.icon_small,
        "icon_medium" => beer2.icon_medium,
        "icon_large" => beer2.icon_large
      }
    ]
  end

  test "shows chosen resource", %{conn: conn} do
    beer = Repo.insert! Beer.changeset(%Beer{}, @valid_attrs)
    conn = get conn, beer_path(conn, :show, beer)
    assert json_response(conn, 200)["beer"] == %{
      "id" => beer.id,
      "name" => beer.name,
      "style" => beer.style,
      "abv" => to_string(beer.abv),
      "description" => beer.description,
      "brewery_name" => beer.brewery_name,
      "icon_small" => beer.icon_small,
      "icon_medium" => beer.icon_medium,
      "icon_large" => beer.icon_large
    }
  end
end
