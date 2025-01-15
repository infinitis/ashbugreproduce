defmodule AshBugReproduce.Resources.Test2.Calculations.Balance do
  use Ash.Resource.Calculation

  @impl Ash.Resource.Calculation
  def calculate(accounts, _, context) do
    opts = Ash.Context.to_opts(context) |> IO.inspect()

    {:ok, Enum.map(accounts, fn _ -> nil end)}
  end
end
