import Config

config :ash, disable_async?: true

config :ash_bug_reproduce, AshBugReproduce.Repo,
  port: 5433,
  database: "ash_bug_reproduce_test",
  pool: Ecto.Adapters.SQL.Sandbox
