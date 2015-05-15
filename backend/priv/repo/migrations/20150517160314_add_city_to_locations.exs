defmodule WeWorkForBeer.Repo.Migrations.AddCityToLocations do
  use Ecto.Migration

  def change do
    alter table(:locations) do
      add :city, :string, null: false
    end
  end
end
