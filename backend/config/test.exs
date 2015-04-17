use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :we_work_for_beer, WeWorkForBeer.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :we_work_for_beer, WeWorkForBeer.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "we_work_for_beer_test",
  size: 1,
  max_overflow: false
