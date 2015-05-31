defmodule WeWorkForBeer.Repo.Migrations.CreateFloorBeer do
  use Ecto.Migration

  def change do
    create table(:floor_beers) do
      add :floor_id, :integer, null: false
      add :beer_id,  :integer, null: false

      timestamps
    end

    create index(:floor_beers, [:floor_id, :beer_id], unique: true)
  end
end
