defmodule WeWorkForBeer.User do
  use WeWorkForBeer.Web, :model

  schema "users" do
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
end
