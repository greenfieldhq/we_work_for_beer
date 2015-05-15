defmodule WeWorkForBeer.LocationTest do
  use WeWorkForBeer.ModelCase

  alias WeWorkForBeer.Location

  @valid_attrs %{address: "some content", name: "some content"}
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
