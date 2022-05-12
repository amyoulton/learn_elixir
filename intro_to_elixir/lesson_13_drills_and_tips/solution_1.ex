defmodule FizzBuzz do
  def run(), do: print_num_or_fizz_buzz(1)

  def print_num_or_fizz_buzz(100), do: IO.puts("Buzz")

  # if the number is divisible by 5 & 3
  def print_num_or_fizz_buzz(num) when rem(num, 15) == 0 do
    IO.puts("FizzBuzz")
    print_num_or_fizz_buzz(num + 1)
  end

  # if the number is divisible by 3
  def print_num_or_fizz_buzz(num) when rem(num, 3) == 0 do
    IO.puts("Fizz")
    print_num_or_fizz_buzz(num + 1)
  end

  # if the number is divisible by 5
  def print_num_or_fizz_buzz(num) when rem(num, 5) == 0 do
    IO.puts("Buzz")
    print_num_or_fizz_buzz(num + 1)
  end

  # if the number is neither divisible by 5 & 3
  def print_num_or_fizz_buzz(num) do
    IO.puts(num)
    print_num_or_fizz_buzz(num + 1)
  end
end

FizzBuzz.run()
