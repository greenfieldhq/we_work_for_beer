defmodule WeWorkForBeer.FloorView do
  use WeWorkForBeer.Web, :view

  @attributes [:id, :name, :location_id]

  def render("index.json", %{floors: floors}) do
    %{floors: render_many(floors, "floor.json")}
  end

  def render("show.json", %{floor: floor}) do
    %{floor: render_one(floor, "floor.json")}
  end

  def render("floor.json", %{floor: floor}) do
    Map.take(floor, @attributes)
  end
end
