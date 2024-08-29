defmodule AshBugReproduce.Test do
  use Ash.Domain

  execution do
    timeout(:infinity)
  end

  resources do
    resource(AshBugReproduce.Resources.Test)
  end
end
