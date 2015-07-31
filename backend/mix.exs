defmodule WeWorkForBeer.Mixfile do
  use Mix.Project

  def project do
    [app: :we_work_for_beer,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {WeWorkForBeer, []},
     applications: [:phoenix, :cowboy, :logger, :ecto, :hackney]]
  end

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [
      {:phoenix, "~> 0.15"},
      {:phoenix_ecto, "~> 0.9"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.0"},
      {:phoenix_live_reload, "~> 0.5", only: :dev},
      {:cowboy, "~> 1.0"},
      {:oauth2, "~> 0.1.1"},
      {:secure_random, "~> 0.1"},
      {:timex, "~> 0.13.4"},
      {:mock, "~> 0.1.1"},
      {:exrm, "~> 0.17.0"},
      {:meck, "~> 0.8.2", [optional: false, hex: :meck, override: true]}
    ]
  end
end
