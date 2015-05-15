defmodule WeWorkForBeer.LocationView do
  use WeWorkForBeer.Web, :view

  @attributes [:id, :address, :name]

  def render("index.json", %{locations: locations}) do
    %{locations: render_many(locations, "location.json")}
  end

  def render("show.json", %{location: location}) do
    %{location: render_one(location, "location.json")}
  end

  def render("location.json", %{location: location}) do
    Map.take(location, @attributes)
  end
end
