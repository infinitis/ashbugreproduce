defmodule AshBugReproduce.Repo do
  use AshPostgres.Repo,
    otp_app: :ash_bug_reproduce

  def installed_extensions do
    ["ash-functions"]
  end
end
