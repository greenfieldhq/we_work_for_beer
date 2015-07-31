defmodule WeWorkForBeer.FloorBeerView do
  use WeWorkForBeer.Web, :view

  def render("index.json", %{floor_beers: floor_beers}) do
    %{floor_beers: render_many(floor_beers, "floor_beer.json")}
  end

  def render("show.json", %{floor_beer: floor_beer}) do
    %{floor_beer: render_one(floor_beer, "floor_beer.json")}
  end

  def render("floor_beer.json", %{floor_beer: floor_beer}) do
    %{
      id: floor_beer.id,
      beer_id: floor_beer.beer_id,
      floor_id: floor_beer.floor_id,
      tapped: floor_beer.tapped
    }
  end
end
