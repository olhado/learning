defmodule Euler1 do

	def optimal_sum_multiples(a, b, x) when is_integer(a) and is_integer(b) and is_integer(x) and a > 0 and  b > 0 and x > 0 do
		a_s = div(x - 1, a)
		b_s = div(x - 1, b)
		#remove dupes
		remove_dupes = div(x - 1, gcd(a, b))
		div((a * a_s) * (a_s + 1), 2) + div((b * b_s) * (b_s + 1), 2) - div((a * b * remove_dupes) * (remove_dupes + 1), 2)
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

	defp gcd(a, b) when a < b and rem(b, a) != 0 do
		a * b
	end

	defp gcd(a, b) when a < b and rem(b, a) == 0 do
		b
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