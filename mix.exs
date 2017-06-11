defmodule VersionHelper.Mixfile do
  use Mix.Project

  def project do
    [
      app: :version_helper,
      version: "0.1.0",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      preferred_cli_env: [espec: :test],
      deps: deps()
    ]
  end

  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:espec, "~> 1.4.0", only: :test}
    ]
  end
end
