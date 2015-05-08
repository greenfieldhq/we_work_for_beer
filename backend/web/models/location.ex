defmodule WeWorkForBeer.Location do
  use Ecto.Model

  schema "locations" do
    field :name
    field :address

    timestamps
  end
end
