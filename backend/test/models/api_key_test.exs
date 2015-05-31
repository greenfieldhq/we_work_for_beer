defmodule WeWorkForBeer.APIKeyTest do
  use WeWorkForBeer.ModelCase
  import Mock

  alias WeWorkForBeer.APIKey
  alias WeWorkForBeer.User

  @valid_attrs %{
    access_token: "some content",
    expires_at: %{day: 17, hour: 14, min: 0, month: 4, year: 2010},
    user_id: 42
  }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = APIKey.changeset(%APIKey{}, @valid_attrs)
    Repo.insert changeset
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = APIKey.changeset(%APIKey{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "create_for/1 creates an api key for user" do
    user_attrs = %{
      email: "some content",
      first_name: "some content",
      last_name: "some content",
      uid: "some content"
    }
    user = Repo.insert(User.changeset(%User{}, user_attrs))

    mocked_date = Timex.Date.now
    with_mock Timex.Date, [:passthrough], [now: fn -> mocked_date end] do
      api_key = APIKey.create_for(user)

      expected_expires_at = Timex.Date.shift(mocked_date, days: 60)
      |> Timex.Date.Convert.to_erlang_datetime
      |> Ecto.DateTime.from_erl

      assert api_key.user_id == user.id
      assert api_key.expires_at == expected_expires_at
      refute api_key.access_token == nil
    end
  end
end
