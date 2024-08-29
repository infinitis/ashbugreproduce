defmodule AshBugReproduce.Resources.Test do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer,
    domain: nil

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

  postgres do
    table("tests")

    repo(AshBugReproduce.Repo)
  end

  code_interface do
    define(:reset_type)
  end
end
