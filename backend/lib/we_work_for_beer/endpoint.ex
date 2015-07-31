defmodule WeWorkForBeer.Endpoint do
  use Phoenix.Endpoint, otp_app: :we_work_for_beer

  # Serve at "/" the given assets from "priv/static" directory
  plug Plug.Static,
    at: "/", from: :we_work_for_beer,
    only: ~w(css images js favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: System.get_env("SESSION_KEY"),
    signing_salt: System.get_env("SIGNING_SALT")

  plug WeWorkForBeer.Router
end
