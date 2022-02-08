defmodule Person do
  defstruct first_name: "", last_name: "", dob: "", hobbies: []
end

map_one = %{a: 1, b: 2}
map_two = %{c: 3, d: 4}

IO.inspect(Map.merge(map_one, map_two))

defmodule Helper do
  def print(%{a: value_a, b: value_b}) when is_map(%{a: value_a, b: value_b}) do
    "You have a map: a is #{value_a}, b is #{value_b}"
  end

  def print(a: value_a, b: value_b) when is_list(a: value_a, b: value_b) do
    "You have a keyword list: a is #{value_a}, b is #{value_b}"
  end
end

IO.inspect(Helper.print(a: 3, b: 4))
IO.inspect(Helper.print(%{a: 1, b: 2}))
