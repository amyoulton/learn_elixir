# Write a piece of code that finds the most recurring letter in a given string.

defmodule StringHelpers do
  def most_recurring_letter(string) do
    string
    |> String.downcase()
    |> String.replace(" ", "")
    |> String.split("", trim: true)
    # |> Enum.reduce(%{}, fn char, acc -> Map.put(acc, char, (acc[char] || 0) + 1) end)
    |> Enum.frequencies()
    |> Enum.max_by(fn {_, x} -> x end)
  end
end

IO.inspect(StringHelpers.most_recurring_letter("Hello World"))
IO.inspect(StringHelpers.most_recurring_letter("fdsklfj mfdsnfjklshdjkfhjas djskljjfsd"))
