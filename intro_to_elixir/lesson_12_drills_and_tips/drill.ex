defmodule StringHelpers do
  def titleize(string) do
    string
    |> String.split()
    |> Enum.map(&String.capitalize(&1))
    |> Enum.join(" ")
  end
end

IO.inspect(StringHelpers.titleize("hello world how are you?"))
