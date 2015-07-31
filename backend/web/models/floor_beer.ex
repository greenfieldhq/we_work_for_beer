defmodule WeWorkForBeer.FloorBeer do
  use WeWorkForBeer.Web, :model

  alias WeWorkForBeer.Beer
  alias WeWorkForBeer.Floor
  alias WeWorkForBeer.Repo

  schema "floor_beers" do
    belongs_to :beer, Beer
    belongs_to :floor, Floor

    field :tapped, :boolean, default: false

    timestamps
  end

  @required_fields ~w(floor_id beer_id)
  @optional_fields ~w(tapped)

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_unique(:beer_id, [on: Repo, scope: [:floor_id]])
  end
end
