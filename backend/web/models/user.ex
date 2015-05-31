defmodule WeWorkForBeer.User do
  use WeWorkForBeer.Web, :model
  import Ecto.Query

  alias WeWorkForBeer.APIKey
  alias WeWorkForBeer.Repo
  alias WeWorkForBeer.User

  schema "users" do
    has_many :api_keys, APIKey

    field :first_name, :string
    field :last_name, :string
    field :uid, :string
    field :email, :string

    timestamps
  end

  @required_fields ~w(email first_name last_name uid)
  @optional_fields ~w()

  def changeset(model, params \\ nil) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def find_by_uid(uid) do
    query = from u in User,
            where: u.uid == ^uid

    Repo.one query
  end
end
