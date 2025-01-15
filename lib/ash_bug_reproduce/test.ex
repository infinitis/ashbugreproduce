defmodule AshBugReproduce.Test do
  use Ash.Domain

  execution do
    timeout(:infinity)
  end

  resources do
    resource(AshBugReproduce.Resources.Test)
    resource(AshBugReproduce.Resources.Test2)
  end
end
