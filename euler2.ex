defmodule Euler2 do
  import Accumulator
  import Integer

  def sum_even_fib(max_val) when is_integer(max_val) and max_val >= 1 do
    sum_even_fib(max_val, 1, 0)
  end

  def sum_even_fib2(max_val) when is_integer(max_val) and max_val >= 1 do
    sum_even_fib2(max_val, 3, 0)
  end

  defp sum_even_fib(max_val, current, acc) do
    curr_fib = fib(current)
    cond do
      curr_fib <= max_val and odd?(curr_fib) ->
        sum_even_fib(max_val, current + 1, acc)
      curr_fib <= max_val and even?(curr_fib) ->
        sum_even_fib(max_val, current + 1, acc + curr_fib)
      true ->
        acc
    end
  end

  defp sum_even_fib2(max_val, current, acc) do
    curr_fib = fib(current)
    cond do
      curr_fib <= max_val ->
        sum_even_fib2(max_val, current + 3, acc + curr_fib)
      true ->
        acc
    end
  end

  def solve do
    IO.puts inspect :timer.tc(Euler2, :sum_even_fib, [4000000])
    IO.puts inspect :timer.tc(Euler2, :sum_even_fib2, [4000000])
  end

end