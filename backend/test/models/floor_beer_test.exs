defmodule WeWorkForBeer.FloorBeerTest do
  use WeWorkForBeer.ModelCase

  alias WeWorkForBeer.FloorBeer

  @valid_attrs %{beer_id: 42, floor_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = FloorBeer.changeset(%FloorBeer{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = FloorBeer.changeset(%FloorBeer{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "uniqueness of beer scoped to floor" do
    fb = FloorBeer.changeset(%FloorBeer{}, @valid_attrs)
    Repo.insert!(fb)

    invalid = FloorBeer.changeset(%FloorBeer{}, @valid_attrs)
    valid = FloorBeer.changeset(%FloorBeer{}, %{beer_id: 1, floor_id: 42})

    refute invalid.valid?
    assert valid.valid?
  end
end
