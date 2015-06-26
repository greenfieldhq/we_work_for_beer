defmodule WeWorkForBeer.BeerTest do
  use WeWorkForBeer.ModelCase

  alias WeWorkForBeer.Beer

  @valid_attrs %{name: "Harpoon IPA", uid: "123"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Beer.changeset(%Beer{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Beer.changeset(%Beer{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "changeset with non-unique uid" do
    Beer.changeset(%Beer{}, Map.put(@valid_attrs, :uid, "123"))
    |> Repo.insert

    changeset = Beer.changeset(%Beer{}, Map.put(@valid_attrs, :uid, "123"))

    refute changeset.valid?
  end

  test "find_by_uid/1 - returns beer if beer with uid exists" do
    attrs = Map.put(@valid_attrs, :uid, "123")
    beer = Repo.insert Beer.changeset(%Beer{}, attrs)

    found_beer = Beer.find_by_uid("123")

    assert found_beer == beer
  end

  test "find_by_uid/1 - returns nil if beer with uid does not exist" do
    assert nil == Beer.find_by_uid("123")
  end
end
