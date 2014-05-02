defmodule Euler5 do

  def solve do
    IO.puts inspect :timer.tc(Euler5, :smallest_multiple, [20])
  end
  
  def smallest_multiple(largest_factor) when is_integer(largest_factor) and largest_factor >= 1 do
    smallest_multiple(largest_factor, largest_factor, largest_factor - 1)
  end

  defp smallest_multiple(multiple, _, 1) do
    multiple
  end

  defp smallest_multiple(multiple, largest_factor, current_factor) do
    cond do
      rem(multiple, current_factor) == 0 ->
        smallest_multiple(multiple, largest_factor, current_factor - 1)
      true ->
        smallest_multiple(multiple + largest_factor, largest_factor, largest_factor + 1)
    end
  end
end