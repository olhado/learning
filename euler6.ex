defmodule Euler6 do
  def solve do
    IO.puts inspect :timer.tc(Euler6, :get_difference, [100])
  end
  
  def get_difference(x) when is_integer(x) and x > 0 do
    y = sum(x, 0)
    (y * y) - sum_squares(x, 0)
  end

  defp sum(1, acc) do
    acc + 1
  end

  defp sum(x, acc) when is_integer(x) do
    sum(x - 1, acc + x)
  end

  defp sum_squares(1, acc) do
    acc + 1
  end

  defp sum_squares(x, acc) when is_integer(x) do
    sum_squares(x - 1, acc + (x * x))
  end
  
end