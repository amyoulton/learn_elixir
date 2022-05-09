# I would recommend you use all things we learned in previous lessons to accomplish the above including:
#  - the |> operator
#  - Pattern Matching
#  - Enum / Map / String...and other libraries
#  - Modules and functions
#  - Anonymous functions

# 1. Given a map of scores such as `%{math: 96, physics: 80, english: 77}` return the highest score.

scores = %{math: 96, physics: 80, english: 77}

scores |> Map.values() |> Enum.max() |> IO.inspect(charlists: :as_lists)

# 2. Write a function that formats strings by doing the following:
# a. remove trailing and ending spaces
# b. replaces multiples spaces with a single space
# c. Capitalizes the first letter of the string
# d. Adds a period at the end (if there is no period)

defmodule Formatting do
  def format(string) do
    new_string =
      string
      |> String.trim()
      |> String.split()
      |> Enum.join(" ")
      |> String.capitalize()

    if(String.ends_with?(new_string, ".")) do
    else
      String.replace_suffix(new_string, "", ".")
    end
  end

  # 3. Write a function that finds the most recurring letter in a given in a string.

  def recurring(string) do
    new_string =
      string
      |> String.split("", trim: true)
      |> Enum.frequencies()
      |> Enum.to_list()
      |> Enum.max_by(fn {_, x} -> x end)

    {a, b} = new_string
    a
  end
end

IO.inspect(Formatting.format("  hello,    how  are you     "))
IO.inspect(Formatting.recurring("hello"))
