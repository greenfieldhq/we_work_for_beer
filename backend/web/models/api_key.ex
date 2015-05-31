defmodule WeWorkForBeer.APIKey do
  use WeWorkForBeer.Web, :model

  alias WeWorkForBeer.APIKey
  alias WeWorkForBeer.Repo

  schema "api_keys" do
    field :user_id, :integer
    field :access_token, :string
    field :expires_at, Ecto.DateTime

    timestamps
  end

  @required_fields ~w(user_id access_token expires_at)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def create_for(user) do
    attrs = %{user_id: user.id}
    |> Map.put(:access_token, _generate_access_token)
    |> Map.put(:expires_at, _generate_expires_at)

    APIKey.changeset(%APIKey{}, attrs)
    |> Repo.insert
  end

  defp _generate_access_token do
    SecureRandom.base64(24)
  end

  defp _generate_expires_at do
    Timex.Date.now
    |> Timex.Date.shift(days: 60)
    |> Timex.Date.Convert.to_erlang_datetime
    |> Ecto.DateTime.from_erl
  end
end
