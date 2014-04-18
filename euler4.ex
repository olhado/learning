defmodule Euler4 do
  import String

  def solve do
    IO.puts inspect :timer.tc(Euler4, :find_largest_palindrome, [3])
  end

  def find_largest_palindrome(num_digits) do
    start_num = round(:math.pow(10, num_digits - 1))
    end_num = binary_to_integer(String.duplicate("9", num_digits))

    find_largest_palindrome(start_num, start_num, end_num, 0)
  end

  defp find_largest_palindrome(x, y, max_num, answer) when x < max_num and y < max_num do
    
    new_answer = x * y
    
    cond do
      is_palindrome?(new_answer) and new_answer > answer ->
        find_largest_palindrome( x, y + 1, max_num, new_answer)
      true ->
        find_largest_palindrome( x, y + 1 , max_num, answer)
    end
  end

  defp find_largest_palindrome(x, y, max_num, answer) when x < max_num do
    
    new_answer = x * y

    cond do
      is_palindrome?(new_answer) and new_answer > answer ->
        find_largest_palindrome( x + 1, x + 1, max_num, new_answer)
      true ->
        find_largest_palindrome( x + 1, x + 1, max_num, answer)
    end
  end

  defp find_largest_palindrome(_, _, _, answer) do
      answer
  end

  defp is_palindrome?(x) when is_integer(x) do
    string_x = to_string(x)
    reverse_string_x = reverse(string_x)

    string_x === reverse_string_x
  end

end