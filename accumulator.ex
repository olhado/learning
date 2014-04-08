defmodule Accumulator do
  def fib(x) when is_integer(x) and x > 0 do
    fib(x, 0, 1)
  end

  def sum(x) when is_integer(x) and x > 0 do
    sum(x, 0)
  end

  def fact(x) when is_integer(x) and x > 0 do
    fact(x, 1)
  end

  defp fact(1, acc) do
    acc
  end

  defp fact(x, acc) do
    fact(x - 1, x * acc)
  end

  defp sum(1, acc) do
    1 + acc
  end

  defp sum(x, acc) do
    sum(x - 1, x + acc)
  end

  defp fib(1, _, acc) do
    acc
  end

  defp fib(x, previous, acc) do
    fib(x - 1, acc, previous + acc)
  end
end