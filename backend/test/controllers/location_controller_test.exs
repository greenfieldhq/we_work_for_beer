defmodule WeWorkForBeer.LocationControllerTest do
  use WeWorkForBeer.ConnCase

  alias WeWorkForBeer.Location
  @valid_params location: %{address: "Fort Point", name: "51 Melcher Street"}
  @invalid_params location: %{fake: "stuff"}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "GET /locations", %{conn: conn} do
    conn = get conn, location_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "GET /locations/:id", %{conn: conn} do
    location = Repo.insert %Location{
      name: "South Station",
      address: "745 Atlantic Ave"
    }
    conn = get conn, location_path(conn, :show, location)
    assert json_response(conn, 200)["data"] == %{
      "id" => location.id,
      "name" => location.name,
      "address" => location.address
    }
  end

  test "POST /locations with valid data", %{conn: conn} do
    conn = post conn, location_path(conn, :create), @valid_params
    assert json_response(conn, 200)["data"]["id"]
  end

  test "POST /locations with invalid data", %{conn: conn} do
    conn = post conn, location_path(conn, :create), @invalid_params
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "PUT /locations/:id with valid data", %{conn: conn} do
    location = Repo.insert %Location{
      name: "South Station",
      address: "745 Atlantic Ave"
    }
    conn = put conn, location_path(conn, :update, location), @valid_params
    assert json_response(conn, 200)["data"] == %{
      "id" => location.id,
      "name" => "Fort Point",
      "address" => "51 Melcher Street"
    }
  end

  test "PUT /locations/:id with invalid data", %{conn: conn} do
    location = Repo.insert %Location{
      name: "South Station",
      address: "745 Atlantic Ave"
    }
    conn = put conn, location_path(conn, :update, location), @invalid_params
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "DELETE /locations/:id", %{conn: conn} do
    location = Repo.insert %Location{
      name: "South Station",
      address: "745 Atlantic Ave"
    }
    conn = delete conn, location_path(conn, :delete, location)
    assert json_response(conn, 200)["data"]["id"]
    refute Repo.get(Location, location.id)
  end
end
