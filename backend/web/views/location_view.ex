defmodule WeWorkForBeer.LocationView do
  use WeWorkForBeer.Web, :view

  def render("index.json", %{locations: locations}) do
    locations  
  end
end
