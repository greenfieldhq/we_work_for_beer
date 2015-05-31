defmodule WeWorkForBeer.Repo.Migrations.CreateAPIKey do
  use Ecto.Migration

  def change do
    create table(:api_keys) do
      add :access_token, :string,   null: false
      add :user_id,      :integer,  null: false
      add :expires_at,   :datetime, null: false

      timestamps
    end

    create index(:api_keys, [:access_token], unique: true)
    create index(:api_keys, [:user_id])
  end
end
