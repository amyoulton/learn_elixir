# We bundle functions within modules in Elixir
# Modules follow CamelCase naming convention

defmodule MyFunctions do
  # functions use snake_case naming convention
  # you can omit brackets in function definitions if the function takes no arguments
  # greet_me/0 (takes no arguments)
  def greet_me do
    # Functions return the last value in the function
    "Hello there!"
  end

  # greet_me/1 (takes 1 argument)
  def greet_me(name) do
    "Hello #{name}"
  end
end

# To execute the function, you type the module name, followed by `.`, then the function name you want to call
# You use "IO.puts" to print the output onto the console

IO.puts(MyFunctions.greet_me())
