defmodule WeWorkForBeer.LocationView do
  use WeWorkForBeer.Web, :view

  def render("index.json", %{locations: locations}) do
    %{data: render_many(locations, "location.json")}
  end

  def render("show.json", %{location: location}) do
    %{data: render_one(location, "location.json")}
  end

  def render("location.json", %{location: location}) do
    %{id: location.id}
  end
end
