defmodule Euler4 do
  import Integer
  import String

  def find_largest_palindrome(num_digits) do
    min_num = parse(:math.pow(10, num_digits - 1))
    max_num = binary_to_integer(duplicate("9", num_digits))
    find_largest_palindrome(min_num, min_num, max_num, [])
  end
  
  defp find_largest_palindrome(x, y, max_num, palindromes) when y < max_num do
    
    cond do
      is_palindrome?(x * y) ->
        find_largest_palindrome( x, y + 1, max_num, palindromes ++ [x * y])
      true ->
        true
    end
  end

  defp is_palindrome?(x) when is_integer(x) do
    string_x = to_string(x)
    reverse_string_x = reverse(string_x)

    string_x === reverse_string_x
  end
end