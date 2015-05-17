defmodule WeWorkForBeer.LocationControllerTest do
  use WeWorkForBeer.ConnCase

  alias WeWorkForBeer.Floor
  alias WeWorkForBeer.Location

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "GET /locations", %{conn: conn} do
    location1 = Repo.insert %Location{
      name: "South Station",
      city: "Boston",
      address: "745 Atlantic Ave"
    }
    location2 = Repo.insert %Location{
      name: "DUMBO",
      city: "New York",
      address: "81 Prospect Street"
    }

    conn = get conn, location_path(conn, :index)
    body = json_response(conn, 200)

    assert body["locations"] == [
      %{
        "id" => location1.id,
        "name" => location1.name,
        "address" => location1.address,
        "city" => location1.city,
        "floor_ids" => []
      },
      %{
        "id" => location2.id,
        "name" => location2.name,
        "address" => location2.address,
        "city" => location2.city,
        "floor_ids" => []
      }
    ]
  end

  test "GET /locations/:id", %{conn: conn} do
    location = Repo.insert %Location{
      name: "South Station",
      city: "Boston",
      address: "745 Atlantic Ave"
    }
    floor1 = Repo.insert %Floor{location_id: location.id, name: "Floor 1"}
    floor2 = Repo.insert %Floor{location_id: location.id, name: "Floor 2"}

    conn = get conn, location_path(conn, :show, location)
    body = json_response(conn, 200)

    assert body["location"] == %{
      "id" => location.id,
      "name" => location.name,
      "address" => location.address,
      "city" => location.city,
      "floor_ids" => [floor2.id, floor1.id]
    }
  end
end
