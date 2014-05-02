defmodule Euler7 do
  require Integer

  def solve do
    IO.puts inspect :timer.tc(Euler7, :get_prime, [10001])
  end
  
  def get_prime(1) do
    2
  end

  def get_prime(x) when is_integer(x) and x > 1 do
    get_prime(x - 1, 3)
  end

  def get_prime(0, current) do
    current - 2
  end

  def get_prime(x, current) do
    cond do
      is_prime(current) ->
        get_prime(x - 1, current + 2)
      true ->
        get_prime(x, current + 2)
    end
  end

  def is_prime(x) do
    is_prime(2,x)
  end
  
  def is_prime(low, high) when low < high do
    cond do
      rem(high, low) == 0 ->
        false
      true ->
        is_prime(low + 1, high)
    end
  end

  def is_prime(high, high) do
    true
  end

end