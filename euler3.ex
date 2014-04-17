defmodule Euler3 do
  def max_prime_factor(x) when is_integer(x) and x >= 2 do
    max_prime_factor(x, 2, [])
    |> Enum.max
  end

  defp max_prime_factor(x, current_factor, factors) when current_factor <= x do
    cond do
      rem(x, current_factor) == 0 ->
        max_prime_factor(div(x, current_factor), current_factor, factors ++ [current_factor] )
      true ->
        max_prime_factor(x, current_factor + 1, factors)
    end
  end

  defp max_prime_factor(x, current_factor, factors) when current_factor > x do
    factors
  end

  def solve do
    :timer.tc(Euler3, :max_prime_factor, [600851475143]) 
  end
end