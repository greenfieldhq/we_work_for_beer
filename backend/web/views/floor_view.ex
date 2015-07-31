defmodule WeWorkForBeer.FloorView do
  use WeWorkForBeer.Web, :view

  alias WeWorkForBeer.FloorBeerView
  alias WeWorkForBeer.BeerView

  @attributes [:id, :name, :location_id]

  def render("index.json", %{floors: floors}) do
    %{floors: render_many(floors, "floor.json")}
  end

  def render("show.json", %{floor: floor}) do
    %{floor_beers: floor_beers} = FloorBeerView.render("index.json", %{floor_beers: floor.floor_beers})
    %{beers: beers} = BeerView.render("index.json", %{beers: floor.beers})

    %{
      floor: render_one(floor, "floor.json"),
      floor_beers: floor_beers,
      beers: beers
    }
  end

  def render("floor.json", %{floor: floor}) do
    %{
      id: floor.id,
      name: floor.name,
      location_id: floor.location_id,
      beer_ids: Enum.map(floor.beers, &(&1.id)),
      floor_beer_ids: Enum.map(floor.floor_beers, &(&1.id))
    }
  end
end
