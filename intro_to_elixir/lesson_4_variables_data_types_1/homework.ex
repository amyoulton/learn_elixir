# Remove leading and trailing spaces

my_string = "  Amy  "

IO.puts(String.trim(my_string))

# Get a character at a particular position

new_string = "CodeCast"

IO.puts(String.at(new_string, 5))

# Turn all the letters to lower case

capitals = "HELLO"

IO.puts(String.downcase(capitals))

# Get the absolute value of an integer

IO.puts(abs(-222.7))

# Raise an integer to the power of 3

IO.puts(Integer.pow(2, 3))

# Insert a value at a particular position

my_tuple = {"hello", "friend"}
IO.puts(Tuple.insert_at(my_tuple, 1, "my"))
