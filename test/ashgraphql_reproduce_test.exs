defmodule AshBugReproduceTest do
  use ExUnit.Case

  alias AshBugReproduce.Resources.Test
  alias Ecto.Adapters.SQL.Sandbox

  setup do
    pid = Sandbox.start_owner!(AshBugReproduce.Repo)
    on_exit(fn -> Sandbox.stop_owner(pid) end)

    :ok
  end


  test "fails to update updated_at during bulk_update" do
    record = Ash.Seed.seed!(Test, %{type: :here})
    %{updated_at: updated_at} = record

    AshBugReproduce.Repo.transaction(fn ->
      Ash.bulk_update!([record], :reset_type, %{},
        resource: Test,
        domain: AshBugReproduce.Test,
        return_errors?: true,
        strategy: :stream
      )

      assert %{updated_at: ^updated_at} =
               Ash.reload!(record, domain: AshBugReproduce.Test)

      AshBugReproduce.Repo.rollback(:ok)
    end)

    %{updated_at: new_updated_at} = Test.reset_type!(record)

    assert updated_at != new_updated_at
  end
end
