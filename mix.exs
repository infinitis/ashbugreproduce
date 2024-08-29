defmodule AshBugReproduce.MixProject do
  use Mix.Project

  def project do
    [
      app: :ash_bug_reproduce,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {AshBugReproduce.Application, []},
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ash, "~> 3.2.6"},
      {:ash_postgres, "~> 2.0.8"}
    ]
  end
end
