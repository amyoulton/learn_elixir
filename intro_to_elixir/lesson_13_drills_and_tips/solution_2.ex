defmodule FizzBuzz do
  def run(start_num \\ 1) do
    Enum.each(start_num..100, &print_num_or_fizz_buzz(&1))
  end

  def print_num_or_fizz_buzz(num) when rem(num, 15) == 0, do: IO.puts("FizzBuzz")
  def print_num_or_fizz_buzz(num) when rem(num, 3) == 0, do: IO.puts("Fizz")
  def print_num_or_fizz_buzz(num) when rem(num, 5) == 0, do: IO.puts("Buzz")
  def print_num_or_fizz_buzz(num), do: IO.puts(num)
end

FizzBuzz.run()
