
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
    |> Repo.insert!

    changeset = Beer.changeset(%Beer{}, Map.put(@valid_attrs, :uid, "123"))

    refute changeset.valid?
  end

  test "find_by_uid/1 - returns beer if beer with uid exists" do
    attrs = Map.put(@valid_attrs, :uid, "123")
    beer = Repo.insert! Beer.changeset(%Beer{}, attrs)

    found_beer = Beer.find_by_uid("123")

    assert found_beer == beer
  end

  test "find_by_uid/1 - returns nil if beer with uid does not exist" do
    assert nil == Beer.find_by_uid("123")
  end

  test "search/2 - returns beers with names that match the search query" do
    bear_beer = Repo.insert! Beer.changeset(%Beer{}, %{uid: "123", name: "Grizzly Bear IPA"})
    dolphin_beer = Repo.insert! Beer.changeset(%Beer{}, %{uid: "456", name: "Dolphin Salt IPA"})
    _cat_beer = Repo.insert! Beer.changeset(%Beer{}, %{uid: "789", name: "Meow Stout"})

    results = Beer |> Beer.search("IPA") |> Repo.all

    assert results == [bear_beer, dolphin_beer]
  end

  test "search/2 - is case insensitive" do
    bear_beer = Repo.insert! Beer.changeset(%Beer{}, %{uid: "123", name: "Grizzly Bear IPA"})
    dolphin_beer = Repo.insert! Beer.changeset(%Beer{}, %{uid: "456", name: "Dolphin Salt IPA"})
    _cat_beer = Repo.insert! Beer.changeset(%Beer{}, %{uid: "789", name: "Meow Stout"})

    results = Beer |> Beer.search("dolphin") |> Repo.all

    assert results == [dolphin_beer]
  end

  test "search/2 - supports partial matches" do
    bear_beer = Repo.insert! Beer.changeset(%Beer{}, %{uid: "123", name: "Grizzly Bear IPA"})
    dolphin_beer = Repo.insert! Beer.changeset(%Beer{}, %{uid: "456", name: "Dolphin Salt IPA"})
    _cat_beer = Repo.insert! Beer.changeset(%Beer{}, %{uid: "789", name: "Meow Stout"})

    results = Beer |> Beer.search("grizz") |> Repo.all

    assert results == [bear_beer]
  end
end
