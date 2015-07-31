defmodule WeWorkForBeer.Repo.Migrations.AddBeerColumns do
  use Ecto.Migration

  def change do
    alter table(:beers) do
      add :icon_small, :string, null: true
      add :icon_medium, :string, null: true
      add :icon_large, :string, null: true
      add :brewery_name, :string, null: true
    end
  end
end
