defmodule WeWorkForBeer.Repo.Migrations.CreateFloors do
  use Ecto.Migration

  def change do
    create table(:floors) do
      add :name, :string, null: false
      add :location_id, :integer, null: false

      timestamps
    end

    create index(:floors, [:location_id], unique: true)
  end
end
