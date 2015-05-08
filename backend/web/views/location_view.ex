defmodule WeWorkForBeer.LocationView do
  use WeWorkForBeer.Web, :view

  def render("index.json", %{locations: locations}) do
    locations
    |> LocationSerializer.to_map
  end

  def render("show.json", %{location: location}) do
    location
    |> LocationSerializer.to_map instance_root: :location
  end
end
