import Config

config :ash_bug_reproduce, AshBugReproduce.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "ash_bug_reproduce_dev",
  port: 5432,
  pool_size: 10
