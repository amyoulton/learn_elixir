# 1. Given a list `[4, 6, 7, 4, 2, 0]`, write a code the returns a tuple of two lists: one that contains all even numbers and the the other contains all odd numbers.

# 2. Given two lists `[1, 2, 3]` and `[:a, :b, :c]`, write a piece of code that returns a list combining the two: `[{1, :a}, {2, :b}, {3, :c}]`.

# 3- Given a list of string `["hey", "abc", "yo"]`, write a piece of code that generates a capitalized sentence that is alphatically ordered. For instance, the code before should return `Abc Hey Yo`

# 4- Given a map `%{a: "hey", b: "abc", c: "yo"}` write a piece of code that capitalizes and prepends `AA` at the end of every element, so you should get back a map such as `%{a: "HeyAA", b: "AbcAA", c: "YoAA"}`.

# 5- Given a list of students (maps of students): `students = [%{name: "John", score: 10}, %{name: "Jen", score: 15}, %{name: "Alex", score: 13}]`. Write a piece of code that returns the student `map` of the student with the highest score.
require Integer

defmodule Helper do
  def even_odd(list) do
    even = Enum.filter(list, &Integer.is_even(&1))
    odd = Enum.filter(list, &Integer.is_odd(&1))
    {even, odd}
  end

  def combine(list1, list2) do
    Enum.zip(list1, list2)
  end

  def capitalize_and_alphabetize(list) do
    Enum.join(Enum.sort(Enum.map(list, fn x -> String.capitalize(x) end)), " ")
  end

  def change_map(map) do
    Enum.into(Enum.map(map, fn {a, b} -> {a, String.capitalize(b) <> "AA"} end), %{})
  end

  def highest_score(students) do
    Enum.max_by(students, & &1.score)
  end
end

IO.inspect(Helper.even_odd([4, 6, 7, 4, 2, 0]), charlists: :as_lists)
IO.inspect(Helper.combine([1, 2, 3], [:a, :b, :c]))
IO.inspect(Helper.capitalize_and_alphabetize(["hey", "abc", "yo"]))
IO.inspect(Helper.change_map(%{a: "hey", b: "abc", c: "yo"}))

IO.inspect(
  Helper.highest_score([
    %{name: "John", score: 10},
    %{name: "Jen", score: 15},
    %{name: "Alex", score: 13}
  ])
)
