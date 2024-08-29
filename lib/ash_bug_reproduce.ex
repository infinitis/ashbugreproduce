defmodule AshBugReproduce.Application do
  use Application

  def start(_type, _args) do
    Supervisor.start_link([AshBugReproduce.Repo],
      strategy: :one_for_one,
      name: Coinbits.Supervisor
    )
  end
end
