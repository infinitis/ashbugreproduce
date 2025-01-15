defmodule AshBugReproduce.Resources.Test do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer,
    domain: AshBugReproduce.Test

  actions do
    defaults([:create, :read])

    update :reset_type do
      accept([])

      change(set_attribute(:type, nil))
    end
  end

  attributes do
    uuid_primary_key(:id)

    attribute(:type, :string, public?: true)

    timestamps()
  end

  calculations do
    calculate :balance, :decimal, expr(
      cond do
        true -> related_test.balance
      end
    )
  end

  postgres do
    table("tests")

    repo(AshBugReproduce.Repo)
  end

  code_interface do
    define(:reset_type)
  end

  relationships do
    has_one :related_test, AshBugReproduce.Resources.Test2 do
      public? false
      destination_attribute :test_id
    end
  end
end
