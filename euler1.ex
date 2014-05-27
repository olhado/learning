defmodule Euler1 do
	
  def solve do
    IO.puts inspect :timer.tc(Euler1, :sum_threes_and_fives, [1000])
    IO.puts inspect :timer.tc(Euler1, :map_reduce_sum_threes_and_fives, [1000])
  end

  def map_reduce_sum_threes_and_fives(a) when is_integer(a) and a > 0 do
    1..a
    |> Enum.filter(fn(x) -> threes_or_fives(x) end)
    |> Enum.reduce(fn(x, acc) -> acc + x end)
  end

  def sum_threes_and_fives(x) when is_integer(x) and x > 0 do
    1..x
    |> Enum.filter(fn(num) -> threes_or_fives(num) end)
    |> Enum.reduce(fn(num, acc) -> num + acc end)
  end

  defp threes_or_fives(x) when rem(x, 5) == 0 or rem(x, 3) == 0 do
    true
  end

  defp threes_or_fives(_) do
    false
  end
end