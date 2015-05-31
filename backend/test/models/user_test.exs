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
end
