defmodule WeWorkForBeer.Location do
  use WeWorkForBeer.Web, :model

  schema "locations" do
    field :address, :string
    field :city, :string
    field :name, :string

    timestamps
  end

  @required_fields ~w(name city address)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ nil) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
