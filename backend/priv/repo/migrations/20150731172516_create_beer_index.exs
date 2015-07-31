defmodule WeWorkForBeer.Repo.Migrations.CreateBeerIndex do
  use Ecto.Migration
  def up do
    execute "CREATE extension if not exists pg_trgm;"
    execute "CREATE INDEX beers_name_brewery_index ON beers USING gin (to_tsvector('english', name || ' ' || brewery_name));"
  end

  def down do
    execute "DROP INDEX beers_name_brewery_index;"
  end
end
