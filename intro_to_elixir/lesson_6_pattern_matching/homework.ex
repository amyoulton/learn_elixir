# Extract the second element in this tuple `{"elixir", "is", "awesome"}` and set it to a variable `a`.

{_, a, _} = {"elixir", "is", "awesome"}
IO.puts(a)

# - Given a list `[1, 2, 3, 4]` do the following:
# - Set variable `a` to value `1`
# - Set variable `b` to value `2`
# - Set variable `c` to the list remainder `[3, 4]`

# Do all that in a single pattern-matching line.

[a, b | c] = [1, 2, 3, 4]
IO.puts(a)
IO.puts(b)
IO.inspect(c)

# Write a module `MysteryBox` that behaves as follows.
# MysteryBox.run({4, 5}) # returns 20 (multiply two numbers)
# MysteryBox.run("hello", "world") # returns "hello world" (concatenate)
# MysteryBox.run("john") # returns "Hello John"

# MysteryBox.run([1, 2, 3, 4]) # returns 10 (sum of list elements)

# MysteryBox.run("hello", "world") # returns 10 (sum of list elements)
# MysteryBox.run(5, 2) # returns 7 (sum of the two elements)

defmodule MysteryBox do
  def run({a, b}) do
    a * b
  end

  def run([a, b, c, d]) do
    a + b + c + d
  end

  def run(a) do
    "Hello #{a}"
  end

  # def run(a, b) do
  #   a <> "" <> b
  # end

  def run(a, b) when is_binary(a) and is_binary(b) do
    String.length(a) + String.length(b)
  end

  def run(a, b) when is_integer(a) and is_integer(b) do
    a + b
  end
end

IO.puts(MysteryBox.run({4, 5}))
IO.puts(MysteryBox.run("hello", "world"))
IO.puts(MysteryBox.run("john"))
IO.puts(MysteryBox.run([7, 6, 11, 4]))
IO.puts(MysteryBox.run("hello", "world"))
IO.puts(MysteryBox.run(5, 2))
