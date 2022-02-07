defmodule MyModule do
  def my_function(string) when is_binary(string) do
    "Hello #{string}"
  end

  def my_function(list) when is_list(list) and length(list) <= 2 do
    length(list)
  end

  def my_function(list) when is_list(list) and length(list) >= 3 do
    List.foldl(list, 1, fn x, acc -> x * acc end)
  end

  def my_function({tup1, tup2}) when is_tuple({tup1, tup2}) do
    "Hello #{tup1} and #{tup2}"
  end

  def my_function(num1, num2) when is_number(num1) and is_number(num2) do
    num1 + num2
  end

  def my_function(string1, string2) when is_binary(string1) and is_binary(string2) do
    string1 <> " #{string2}"
  end

  def my_function(num1, num2, num3)
      when is_number(num1) and is_number(num2) and is_number(num3) do
    num1 + num2 + num3
  end
end

# Return "Hello Apple"
IO.inspect(MyModule.my_function("apple"))
# for lists returns 2 (sum for list elements that are size 2 or less)
IO.inspect(MyModule.my_function([1, 2]))
# # returns 24 (product of list elements for sizes 3 or more)
IO.inspect(MyModule.my_function([1, 2, 3, 4]))
# # Return "Hello Apple and Jen" (assum a tuple with size 2)
IO.inspect(MyModule.my_function({"John", "Jen"}))
# # returns 3 (1 + 2)
IO.inspect(MyModule.my_function(1, 2))
# # returns "Hello World" (concatenate with a space)
IO.inspect(MyModule.my_function("Hello", "World"))
# # returns 6 (1 + 2 + 3)
IO.inspect(MyModule.my_function(1, 2, 3))
