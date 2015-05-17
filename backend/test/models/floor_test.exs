defmodule WeWorkForBeer.FloorTest do
  use WeWorkForBeer.ModelCase

  alias WeWorkForBeer.Floor

  @valid_attrs %{name: "Floor 7", location_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Floor.changeset(%Floor{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Floor.changeset(%Floor{}, @invalid_attrs)
    refute changeset.valid?
  end
end
