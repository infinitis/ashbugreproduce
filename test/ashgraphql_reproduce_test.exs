defmodule AshBugReproduceTest do
  use ExUnit.Case

  alias AshBugReproduce.Resources.Test

  test "fails to update updated_at during bulk_update" do
    record = Ash.Seed.seed!(Test, %{type: :here})
    %{updated_at: updated_at} = record

    AshBugReproduce.Repo.transaction(fn ->
      Ash.bulk_update!([record], :reset_type, %{},
        resource: CybridCustodialAccount,
        return_errors?: true,
        strategy: :stream
      )

      assert %{updated_at: ^updated_at} =
               Ash.reload!(record)

      AshBugReproduce.Repo.rollback(:ok)
    end)

    %{updated_at: new_updated_at} =
      Test.reset_type!(record, authorize?: false)

    assert updated_at != new_updated_at
  end
end
