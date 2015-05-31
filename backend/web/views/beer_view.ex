defmodule WeWorkForBeer.BeerView do
  use WeWorkForBeer.Web, :view

  def render("index.json", %{beers: beers}) do
    %{beers: render_many(beers, "beer.json")}
  end

  def render("show.json", %{beer: beer}) do
    %{beer: render_one(beer, "beer.json")}
  end

  def render("beer.json", %{beer: beer}) do
    %{
      id: beer.id,
      name: beer.name,
      style: beer.style,
      abv: beer.abv,
      description: beer.description
    }
  end
end
