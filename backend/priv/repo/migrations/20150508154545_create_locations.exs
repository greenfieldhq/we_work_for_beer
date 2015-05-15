defmodule WeWorkForBeer.Repo.Migrations.CreateLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :address, :string, null: false
      add :name,    :string, null: false

      timestamps
    end
  end
end
