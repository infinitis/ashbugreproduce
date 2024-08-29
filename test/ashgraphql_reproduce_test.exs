defmodule AshgraphqlReproduceTest do
  use ExUnit.Case
  doctest AshgraphqlReproduce

  defmodule TestResource do
    use Coinbits.Resource,
      data_layer: AshPostgres.DataLayer,
      extensions: [
        AshGraphql.Resource
      ]

    actions do
      defaults [:create, :read]

      update :reset_type do
      end
    end

    attributes do
      uuid_primary_key(:id)

      attribute :type, :string, public?: true

      timestamps()
    end

    graphql do
      type :test

      mutations do
        update :reset_type, :reset_type
      end
    end
  end

  test "fails to update updated_at during bulk_update" do
  end
end
