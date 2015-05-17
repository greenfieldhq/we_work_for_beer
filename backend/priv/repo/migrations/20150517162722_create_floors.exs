defmodule WeWorkForBeer.Repo.Migrations.CreateFloors do
  use Ecto.Migration

  def change do
    create table(:floors) do
      add :location_id, :integer, null: false
      add :name, :string, null: false

      timestamps
    end

    create index(:floors, [:location_id])
  end
end
