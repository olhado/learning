defmodule Euler1 do
	
  def solve do
    IO.puts inspect :timer.tc(Euler1, :sum_threes_and_fives, [1000])
    IO.puts inspect :timer.tc(Euler1, :lc_sum_threes_and_fives, [1000])
    IO.puts inspect :timer.tc(Euler1, :map_reduce_sum_threes_and_fives, [1000])
  end

  def map_reduce_sum_threes_and_fives(a) when is_integer(a) and a > 0 do
    1..a
    |> Enum.filter(fn(x) -> rem(x, 5) == 0 or rem(x, 3) == 0 end)
    |> Enum.reduce(fn(x, acc) -> acc + x end)
  end

  def sum_threes_and_fives(x) when is_integer(x) and x > 0 do
    range = 1..(x-1)
    Enum.filter(range, fn(num) -> threes_or_fives(num) end)
    |> Enum.reduce(fn(num, acc) -> num + acc end)
  end

  def lc_sum_threes_and_fives(x) when is_integer(x) and x > 0 do
    the_range = span(1, x-1)
    # Have to assign before use
    values_to_sum = lc num inlist the_range, threes_or_fives(num) == true, do: num
    Enum.reduce(values_to_sum, fn(num, acc) -> num + acc end)
  end

  defp span(from, to) when from > to do
    []
  end

  defp span(from, to) do
    [from | span(from + 1, to)]
  end

  defp threes_or_fives(x) when rem(x, 5) == 0 or rem(x, 3) == 0 do
    true
  end

  defp threes_or_fives(_) do
    false
  end
end