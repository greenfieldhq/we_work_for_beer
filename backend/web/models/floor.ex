defmodule WeWorkForBeer.Floor do
  use WeWorkForBeer.Web, :model

  alias WeWorkForBeer.Location

  schema "floors" do
    belongs_to :location, Location

    field :name, :string

    timestamps
  end

  @required_fields ~w(name location_id)
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
