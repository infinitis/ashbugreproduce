defmodule AshBugReproduce.Resources.Test2 do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer,
    domain: AshBugReproduce.Test

  actions do
    defaults([:create, :read])
  end

  attributes do
    uuid_primary_key(:id)

    attribute(:type, :string, public?: true)

    timestamps()
  end

  postgres do
    table("test2s")

    repo(AshBugReproduce.Repo)
  end

  calculations do
    calculate :balance, :decimal, __MODULE__.Calculations.Balance
  end

  relationships do
    belongs_to :test, AshBugReproduce.Resources.Test do
      public? true
      allow_nil? false
    end
  end
end
