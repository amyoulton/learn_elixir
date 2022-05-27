# Write a piece of code that finds the most recurring letter in a given string.

defmodule StringHelpers do
  def most_recurring_letter(string) do
    string
    |> String.downcase()
    |> String.replace(" ", "")
    |> String.split("", trim: true)
    |> Enum.frequencies()
    |> Enum.max_by(fn {_, x} -> x end)
    |> case do
      {letter, num} when letter == "a" ->
        "The letter #{letter} appears #{num} times and it is a vowel."

      {letter, num} when letter == "e" ->
        "The letter #{letter} appears #{num} times and it is a vowel."

      {letter, num} when letter == "i" ->
        "The letter #{letter} appears #{num} times and it is a vowel."

      {letter, num} when letter == "o" ->
        "The letter #{letter} appears #{num} times and it is a vowel."

      {letter, num} when letter == "u" ->
        "The letter #{letter} appears #{num} times and it is a vowel."

      {letter, num} ->
        "The letter #{letter} appears #{num} times and it is NOT a vowel."

      _ ->
        "Something went wrong."
    end
  end
end

IO.inspect(StringHelpers.most_recurring_letter("Helloooooooo World"))

IO.inspect(
  StringHelpers.most_recurring_letter("fdsklfj mfdsnfjklsaaaaaaaaaaahdjkfhjas djskljjfsd")
)
