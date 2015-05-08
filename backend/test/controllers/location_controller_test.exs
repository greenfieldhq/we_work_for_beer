defmodule WeWorkForBeer.ContactControllerTest do
  use WeWorkForBeer.Case, async: false

  test "/index returns a list of contacts" do
    location_as_json=
      %Location{name: "Berkeley", address: "2120 University Avenue"}
      |> Repo.insert
      |> List.wrap
      |> Poison.encode!

    response = conn(:get, "/api/locations") |> send_request

    assert response.status == 200
    assert response.resp_body == location_as_json
  end
end
