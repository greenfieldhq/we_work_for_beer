defmodule WeWorkForBeer.LocationTest do
  use WeWorkForBeer.ModelCase

  alias WeWorkForBeer.Location

  @valid_attrs %{
    address: "51 Melcher St",
    city: "Boston",
    name: "Fort Point"
  }

  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Location.changeset(%Location{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Location.changeset(%Location{}, @invalid_attrs)
    refute changeset.valid?
  end
end
