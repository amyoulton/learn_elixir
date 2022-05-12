# 1- Have the function return a list instead of printing, so the returned list will look something like: `[1, 2, "FIZZ", 4, "BUZZ", "FIZZ", 7, ...., 13, 14, "FIZZBUZZ", ...]`

defmodule FizzBuzz do
  def run(start_num \\ 1) do
    Enum.map(start_num..100, &print_num_or_fizz_buzz(&1))
  end

  def print_num_or_fizz_buzz(num) when rem(num, 15) == 0, do: "FizzBuzz"
  def print_num_or_fizz_buzz(num) when rem(num, 3) == 0, do: "Fizz"
  def print_num_or_fizz_buzz(num) when rem(num, 5) == 0, do: "Buzz"
  def print_num_or_fizz_buzz(num), do: num
end

# IO.inspect(FizzBuzz.run())

# 2- Have the function return a map that looks like `%{0 => 1, 1 => 2, 2 => "FIZZ", 3 => 4, 5 => "BUZZ", ...}`

defmodule FizzBuzz1 do
  def run(start_num \\ 1) do
    # start_num..100
    # |> Enum.to_list()
    # |> Enum.zip(Enum.map(start_num..100, &print_num_or_fizz_buzz(&1)))
    # |> Map.new()

    Enum.reduce(start_num..100, %{}, fn x, acc -> Map.put(acc, x, print_num_or_fizz_buzz(x)) end)
  end

  def print_num_or_fizz_buzz(num) when rem(num, 15) == 0, do: "FizzBuzz"
  def print_num_or_fizz_buzz(num) when rem(num, 3) == 0, do: "Fizz"
  def print_num_or_fizz_buzz(num) when rem(num, 5) == 0, do: "Buzz"
  def print_num_or_fizz_buzz(num), do: num
end

# IO.inspect(FizzBuzz1.run())

# 3- Have the function return a keyword list that looks like `["0": 1, "1": 2, "2": "FIZZ", "3": 4, "5": "BUZZ",....]`

defmodule FizzBuzz2 do
  def run(start_num \\ 1) do
    nums =
      start_num..100
      |> Enum.map(&Integer.to_string(&1))
      |> Enum.map(&String.to_atom(&1))

    list = Enum.zip(nums, Enum.map(start_num..100, &print_num_or_fizz_buzz(&1)))
  end

  def print_num_or_fizz_buzz(num) when rem(num, 15) == 0, do: "FizzBuzz"
  def print_num_or_fizz_buzz(num) when rem(num, 3) == 0, do: "Fizz"
  def print_num_or_fizz_buzz(num) when rem(num, 5) == 0, do: "Buzz"
  def print_num_or_fizz_buzz(num), do: num
end

IO.inspect(FizzBuzz2.run())
