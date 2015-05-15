defmodule WeWorkForBeer.Case do
  use ExUnit.CaseTemplate
  alias Ecto.Adapters.SQL
  alias WeWorkForBeer.Repo

  setup do
    SQL.begin_test_transaction(Repo)

    on_exit fn ->
      SQL.rollback_test_transaction(Repo)
    end
  end

  using do
    quote do
      alias WeWorkForBeer.Repo
      alias WeWorkForBeer.Location
      use Plug.Test

      # Remember to change this from `defp` to `def` or it can't be used in your
      # tests.
      def send_request(conn) do
        conn
        |> put_private(:plug_skip_csrf_protection, true)
        |> WeWorkForBeer.Endpoint.call([])
      end
    end
  end
end

ExUnit.start

# Create the database, run migrations, and start the test transaction.
Mix.Task.run "ecto.create", ["--quiet"]
Mix.Task.run "ecto.migrate", ["--quiet"]
Ecto.Adapters.SQL.begin_test_transaction(WeWorkForBeer.Repo)
