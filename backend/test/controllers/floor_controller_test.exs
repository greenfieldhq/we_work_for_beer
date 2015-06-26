defmodule WeWorkForBeer.FloorControllerTest do
  use WeWorkForBeer.ConnCase

  alias WeWorkForBeer.Floor

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "GET /floors", %{conn: conn} do
    floor1 = Repo.insert %Floor{
      location_id: 42,
      name: "Floor 7"
    }
    floor2 = Repo.insert %Floor{
      location_id: 42,
      name: "Floor 2"
    }

    conn = get conn, floor_path(conn, :index)
    body = json_response(conn, 200)

    assert body["floors"] == [
      %{
        "id" => floor1.id,
        "name" => floor1.name,
        "location_id" => floor1.location_id,
        "beer_ids" => []
      },
      %{
        "id" => floor2.id,
        "name" => floor2.name,
        "location_id" => floor2.location_id,
        "beer_ids" => []
      }
    ]
  end

  test "GET /floors/:id", %{conn: conn} do
    floor = Repo.insert %Floor{
      location_id: 42,
      name: "Floor 7"
    }

    conn = get conn, floor_path(conn, :show, floor)
    body = json_response(conn, 200)

    assert body["floor"] == %{
      "id" => floor.id,
      "name" => floor.name,
      "location_id" => floor.location_id,
      "beer_ids" => []
    }
  end
end
