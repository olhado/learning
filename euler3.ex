defmodule Euler3 do
  import Integer

  def solve do
    IO.puts inspect :timer.tc(Euler3, :max_prime_factor, [600851475143]) 
  end

  def max_prime_factor(x) when is_integer(x) and x >= 2 do
    max_prime_factor(x, 2, 1)
  end

  defp max_prime_factor(x, 2, answer) do
    cond do
      even?(x) == 0 ->
        max_prime_factor(div(x, 2), 2, 2)
      true ->
        max_prime_factor(x, 3, answer)
    end
  end

  defp max_prime_factor(x, current_factor, answer) when current_factor <= x and Integer.odd?(current_factor) do
    cond do
      rem(x, current_factor) == 0 ->
        max_prime_factor(div(x, current_factor), current_factor, current_factor)
      true ->
        max_prime_factor(x, current_factor + 1, answer)
    end
  end

  # Skip even factors after 2, since they are not primes
  defp max_prime_factor(x, current_factor, answer) when current_factor <= x and Integer.even?(current_factor) do
      max_prime_factor(x, current_factor + 1, answer)
  end

  defp max_prime_factor(_, _, answer) do
    answer
  end
end