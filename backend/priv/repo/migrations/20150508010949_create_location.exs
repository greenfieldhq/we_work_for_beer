defmodule WeWorkForBeer.Repo.Migrations.CreateLocation do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :name, :string, null: false
      add :address, :string, null: false

      timestamps
    end
  end
end
