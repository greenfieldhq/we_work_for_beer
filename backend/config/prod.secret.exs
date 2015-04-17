use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :we_work_for_beer, WeWorkForBeer.Endpoint,
  secret_key_base: "E/FJnDuLxE2Ox0oQwHqvJs84ehNQu69txMTfUd5lMYAaP5eUdddoUCAxCA5k3XRg"

# Configure your database
config :we_work_for_beer, WeWorkForBeer.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "we_work_for_beer_prod"
