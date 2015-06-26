defmodule WeWorkForBeer.Repo.Migrations.CreateBeer do
  use Ecto.Migration

  def change do
    create table(:beers) do
      add :uid,         :string, null: false
      add :name,        :string, null: false
      add :style,       :string
      add :abv,         :decimal
      add :description, :text

      timestamps
    end

    create index(:beers, [:uid], unique: true)
  end
end
