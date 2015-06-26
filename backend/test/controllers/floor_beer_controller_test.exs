defmodule WeWorkForBeer.FloorBeerControllerTest do
  use WeWorkForBeer.ConnCase

  alias WeWorkForBeer.FloorBeer
  @valid_attrs %{beer_id: 1, floor_id: 9}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, floor_beer_path(conn, :create), floor_beer: @valid_attrs
    assert json_response(conn, 200)["floor_beer"]["id"]
    assert Repo.get_by(FloorBeer, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, floor_beer_path(conn, :create), floor_beer: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end
end
