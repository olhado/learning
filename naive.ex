defmodule Naive do
  def fib(x) when is_integer(x) and x > 2 do
    fib(x - 1) + fib(x - 2)
  end

  def fib(1) do
    1
  end

  def fib(2) do
    1
  end

  def sum(x) when is_integer(x) and x > 0 do
    x + sum(x - 1)
  end

  def sum(0) do
    0
  end

  def fact(x) when is_integer(x) and x > 1 do
    x * fact(x - 1)
  end

  def fact(1) do
    1
  end
  
      
end