defmodule WeWorkForBeer.Location do
  use Ecto.Model

  schema "floors" do
    field :name, :string
    field :location_id, :integer

    timestamps
  end
end
