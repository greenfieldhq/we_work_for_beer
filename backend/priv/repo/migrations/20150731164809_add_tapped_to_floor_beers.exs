defmodule WeWorkForBeer.Repo.Migrations.AddTappedToFloorBeers do
  use Ecto.Migration

  def change do
    alter table(:floor_beers) do
      add :tapped, :boolean, default: false, null: false
    end
  end
end
