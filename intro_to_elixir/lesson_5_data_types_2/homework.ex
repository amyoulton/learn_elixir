# Delete an element of a list

my_list = [1, 2, 3, 4]

IO.inspect(List.delete(my_list, 3))

# Replace an element at a given index within a list

IO.inspect(List.replace_at(my_list, 3, 8))

nested_list = [[1, 2], [3, 4], [5, 6]]

IO.inspect(List.flatten(nested_list))

IO.inspect(my_list)
IO.inspect(nested_list)
