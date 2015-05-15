defmodule WeWorkForBeer.LocationControllerTest do
  use WeWorkForBeer.ConnCase

  alias WeWorkForBeer.Location

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "GET /locations", %{conn: conn} do
    location1 = Repo.insert %Location{
      name: "South Station",
      address: "745 Atlantic Ave"
    }
    location2 = Repo.insert %Location{
      name: "DUMBO",
      address: "81 Prospect Street"
    }

    conn = get conn, location_path(conn, :index)
    body = json_response(conn, 200)

    assert body["locations"] == [
      %{
        "id" => location1.id,
        "name" => location1.name,
        "address" => location1.address
      },
      %{
        "id" => location2.id,
        "name" => location2.name,
        "address" => location2.address
      }
    ]
  end

  test "GET /locations/:id", %{conn: conn} do
    location = Repo.insert %Location{
      name: "South Station",
      address: "745 Atlantic Ave"
    }

    conn = get conn, location_path(conn, :show, location)
    body = json_response(conn, 200)

    assert body["location"] == %{
      "id" => location.id,
      "name" => location.name,
      "address" => location.address
    }
  end
end
