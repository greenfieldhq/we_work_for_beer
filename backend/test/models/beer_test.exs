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
end
