import Config

config :ash_bug_reproduce, ash_domains: [AshBugReproduce.Test]

config :ash_bug_reproduce, ecto_repos: [AshBugReproduce.Repo]

config :ash_bug_reproduce, AshBugReproduce.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "ash-bug-reproduce-dev"

import_config "#{config_env()}.exs"
