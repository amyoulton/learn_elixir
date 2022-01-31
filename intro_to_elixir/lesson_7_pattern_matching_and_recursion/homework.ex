defmodule RecursiveMod do
  # Find the number of elements in a list
  def number_of_elements([]), do: 0

  def number_of_elements([_element | remainder]) do
    1 + number_of_elements(remainder)
  end

  # Convert a list to a string composed of all the elements. For example, if the list is `[3, 5, "hey", 10]`, you should return a string `"35hey10"`

  def concat_string([]), do: ""

  def concat_string([element | remainder]) do
    "#{element}" <> concat_string(remainder)
  end
end

IO.inspect(RecursiveMod.concat_string([3, 5, "hey", 10]))
_
