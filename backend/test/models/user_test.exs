defmodule WeWorkForBeer.UserTest do
  use WeWorkForBeer.ModelCase

  alias WeWorkForBeer.User

  @valid_attrs %{
    email: "some content",
    first_name: "some content",
    last_name: "some content",
    uid: "some content"
  }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "find_by_uid/1 - returns user if user with uid exists" do
    attrs = Map.put(@valid_attrs, :uid, "123")
    user = Repo.insert! User.changeset(%User{}, attrs)

    found_user = User.find_by_uid("123")

    assert found_user == user
  end

  test "find_by_uid/1 - returns nil if user with uid does not exist" do
    assert nil == User.find_by_uid("123")
  end
end
