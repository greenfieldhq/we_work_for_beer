import Ecto.Model

defmodule WeWorkForBeer.LocationView do
  use WeWorkForBeer.Web, :view

  alias WeWorkForBeer.Repo

  @attributes [:id, :address, :city, :name]

  def render("index.json", %{locations: locations}) do
    %{locations: render_many(locations, "location.json")}
  end

  def render("show.json", %{location: location}) do
    %{location: render_one(location, "location.json")}
  end

  def render("location.json", %{location: location}) do
    floors = Repo.all assoc(location, :floors)

    location
    |> Map.take(@attributes)
    |> Map.put(:floor_ids, Enum.map(floors, &(&1.id)))
  end
end
