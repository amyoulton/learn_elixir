# Intro to Elixir

## Lesson 1 | Hello, World

Elixir utilizes Erlang VM (Virtual Machine).

You can run files in the terminal by typing `elixir <filename>`.

## Lesson 2 | Immutability

Immutable = once you've set that data in memory, you cannot change it.

If multiple process are going to look at the same point in memory, it can cause issues. Process one might mutate it but process two would be looking for the data before mutating it.

The solution: to make a "copy" of the data, so the original data still exists for other processes.

Multi-threaded program is becoming more and more necessary.

With Elixir, you'll see a lot of functions calling other functions calling other functions.

JavaScript uses a single thread so mutating data is not an issue. Using mutiple threads is where the issue lies.

Given the same languages, it can be a bit slower. In some cases, you'll be copying data over and over. In most cases the gain is worth it.

Having immutable data structures help in easing writing multi-threaded programs.

It also helps reduce side effects that come from bigger complex projects.

Writing code with immutable data structures can be a bit trickier.

You don't need a functional language to use functional programming.

So **Don't confused reassignment with mutability**.

Reassignment means that the pointed to the old varaible now points to a new spot in memory.

Example

```js
name = "Tam"
name1 = name;
name = "John";
console.log(name1); // "Tam"
```

## Lesson 3 | On Functions

Elixir is a compiled language. Files get compiled before you can run them.

Elixir file --> BEAM --> Run the Beam on Erlang VM

You will see two types of files primarily in Elixir `.ex` which gets compiled, `.exs` doesn't get compiled. 

Elixir can run files without compiling them which serves a good purpose for things like writing tests that you don't need to be compiled.

**Interactive Elixir**

You can start a program `iex` which is interactive Elixir to execute Elixir code on the fly. It doesn't auto access all the files i your project. You have to compile it.

Within Interactive Elixir (iex) you can "bring" a module by compiling its file using code like:

```elixir
c "./on_functions.ex"
```

## Lesson 4 | Variables and Data Types (Part 1)

### Variables

Elixir is dynamically typed (you don't have to specify the type of variable when declaring the variable)

```elixir
a = 1
name = "Tam"
```

Elixir follows `snake_case` convention for variable naming.

You can always find more information about the particular type in Elixir using hexdocs: https://hexdocs.pm.

Kernel is Elixir's default environment. You can invoke kernel functions without the use of the `Kernel.` prefix.

### Integers and Floats

We can define integers and floats by simply putting numbers. Floats get defined when there is a decimal to the number.

```elixir
im_an_integer = 123
im_a_float = 123.5
```

You can make use the Elixir built in Integer and Float modules to get access to handy functions:
https://hexdocs.pm/elixir/1.12/Integer.html

### Strings

You can define strings using `"`.

When you use single quotes, `'` in Elixir, you're actually defining a character list. 

Practically speaking, you almost always deal with strings using `"`.

Strings are stored as binary. A binary is a series of bits that is divisible by 8.

To concatenate two strings together we use `<>`. 

To interpolate two strings we us `#{}` syntax as such:

```elixir
greeting = "hello"
"#{greeting}, World!"
```

### Tuples

Fixed-size collection of values. You can define tuples using `{}`. 

Very similar to arrays in other languages. They are fixed sized, and are usually stored in a continous block in memory. They're usually used for very small sets of data, ie. 2-3 elements.

For instance, they are widely used when we need to return more than a single element from a function.

Tuples are stored in continous blocks of Data. Accessing elements in a tuple by its index is easy, but it becomes hard to store large amount of data in tuples because they have to find continous blocks to be stored.

```elixir
defmodule MyModule do
  def my_function do
    {1, 2}
  end
end
```

## Lesson 5 | Lists

We define lists using `[]`.

Lists are implemented using `Linked List` principles. 

When we want to work with a large amount of data, we prefer lists to tuples.

```elixir
my_list = [1, 2, 3]
new_list = ["a" | my_list]
```

`|` is the pipe operator. 

In lists you can have different types of Data. Lists won't mutate the original list, but it won't duplicate any other included lists point in data.

To concatenate two lists together, we use the `++` operator.  If possible, we prefer using the `|` operator to expand the list instaad of using `++`. It's more efficent memory wise because you're not duplicating the other lists points in data.

```elixir 
[1, 2] ++ [3, 4]
```

If possible, we prefer using the `|` to expand the list, instead of using the `++`.

You can look at the built-in `List` module that contains many handy functions to work with lists. Here is an exmaple.

```elixir
my_list = [1, 2, 3]
List.insert_at(my_list, 1, "abc")
```

## Lesson 6 | Pattern Matching

```elixir
a = 1
name = "Jen"
```

Elixir takes the `=` operator to the next level. I want you to think of a pattern matching operator, and not simply an assignment operator. 

```elixir
{a, b} = {1, 2}
# a will be 1
# b will be 2

a = {1, 2}
#a will be {1, 2}
```

The pattern matching feature using `=` expects exact matching or we will get an error.

```elixir
{a, b, c} = {1, 2}
# will throw an error, (MatchError)
```
We can use variables prefixed with `_` if we don't care about a particular assignment or we can simply use `_`.

```elixir
my_tuple = {1, 2, 3}
# {1, 2, 3}
{a, b} = my_tuple
# ** (MatchError) no match of right hand side value: {1, 2, 3}
{a, b, _} = my_tuple
# {1, 2, 3}
# {a, b, _c} = my_tuple
{1, 2, 3}
c
# ** (CompileError) iex:8: undefined function c/0
a
# 1
b
# 2
```
We can use pattern matching with most data types and structures:

```elixir
"hello" <> rest_of_sentence = "hello world, how is it going?"
rest_of_sentence will be " world, how is it going?"
```

### Pattern matching lists

```elixir
my_list = [1, 2, 3]
# [1, 2, 3]
new_list = [0 | my_list]
# [0, 1, 2, 3]
new_list
# [0, 1, 2, 3]
[a, b, c, d] = new_list
# [0, 1, 2, 3]
 a
# 0
b
# 1
c
# 2
d
# 3
[a | rest_of_list] = new_list
# [0, 1, 2, 3]
rest_of_list
# [1, 2, 3]
[x | rest_of_rest_of_list] = rest_of_list
# [1, 2, 3]
rest_of_rest_of_list
# [2, 3]
x
# 1
[a | b] = []
# ** (MatchError) no match of right hand side value: []

[a | b] = [1]
# [1]
b
# []
```
### Pattern matching functions

Pattern matching functions in Elixir goes beyond simple function overriding by matching the actual parameters given to the function.

```js
function hello (a) {}
function hello (a, b) {}

// hello("a")
// hello("a", "b")
```

```elixir
defmodule MyModule do
  def my_fun({a, b}) do
    IO.puts "Hello #{a} and hello #{b}"
  end

  def my_fun(a) do
    IO.puts "Hello #{a}"
  end

  def my_fun({a, b}, c) do
    IO.puts "Goodbye #{a} and goodbye #{b} and you too #{c}"
  end

  def my_fun(a, b) do
  IO.puts "Goodbye #{a} and goodbye #{b}"
  end
end
```

## Lesson 7 | Pattern Matching & Recursion

Recursive function that calls itself. The most important thing when writing a rescursive function is that there must be a case where the recursion stops, otherwise you get stack overflow.

Stack: last in first out data structure. Function calls are put in the stack memory.

I find it easiest to split the problem into a recursive definition before writing code.

`sum([1, 2, 3, 4])` can be written as 1 + `sum([2, 3, 4])` which can be written can be written as `1 + 2 + sum([2, 3])` which can be written as `1 + 2 + 3 + 4 + sum([])`. We have to define that the sum of an empty array is 0. Consequently, `1 + 2 + 3 + 4 + 0` which will return 10.

Recursion is generally a great way to work with immutable data structures.

In many ways, pattern matching is the preferred way to control the flow of the application.

## Lesson 8 | Pattern Matching w. Guards

Guards are really usefully when you want to do checks for attributes you cannot do with simple pattern matching.

## Lesson 9 | Maps, Structs & Keyword Lists

### Maps

Maps are the primary key/value storage in Elixir.

Keys in maps can be any type, most commonly atoms or strings. Values can also be anything.

Here is how we define a map in Elixir:

```elixir
my_map = %{"name" => "John Smith", "age" => 15}
my_map["age"] 
15
my_map["name"]
"John Smith"
```
It doesn't always respect the order you entered it in. 

It's most common to use atoms. Atoms are like constants. They are defined using `:` before the name of the atom. For instance, we can have `:apple` or `:ok`. They are most commonly used as return values (sually in tuples), like `{:error, "invalid input"}`.

Also its very common to use atoms as keys to maps:

```elixir
my_map = %{:name => "John Smith", :age => 15}
# which can be shortened to a syntax you may be more familar with
my_map = %{name: "John Smith", age: 15}
# if you do so, using atoms as keys, you have a nice syntax sugar to access values:
IO.puts my_map.name
IO.puts my_map.age
```
You can use the `Map` library that is built in with Elixir to perform functions on maps.
### Structs

If we want more control over key/value data structure, we can use Structs that enforce the prescence of certain keys. Structs are probably the closest to what you might see in an OOP language.

```elixir
defmodule Person do
defstruct name: "", age: 15
end
```

We can use the struct similar to how we use a map, for instance:

```elixir
j = %Person{name: "John Smith"}
j.age 
15
j.name
"John Smith"
```
When you're using structs it will enforce what keys you're able to assign. Defining the module that contains a struct makes what the keys strict.

### Keyword Lists

Are basically lists with extra features. It behaves like a key/vale data structure but it's a list at the end of the day. It's common in functional programming languages to have lists like this:

```elixir
# if you write a list in this particular format it behaves as keyvalue storage
my_list = [{:a, 1}, {:b, 2}]
```

Key things to know know for keyword lists:
- order matters in keyword lists -> things are stored in the order you create them at, which is not always true with maps
- Keys are always atoms 
- Keys can appear more than once

## Lesson 10 | Enum & Anonymous Functions

### Enum

Enum is a built in library for Elixir. It works on enumerables. Lists, Maps, and Ranges are common data types used with Enumerables.

### Anonymous Functions

We have learned to define functions within modules, for example:

```elixir
defmodule HelperMethods do
  def add_five(x) do
    x + 5
  end
end
```

In some cases you need to define anonymous functions or set a function to a variable. You can do this in Elixir using this syntax:

```elixir
add_five = fn x -> x + 5 end
```

To call it, you will have to use the `.` syntax.

```elixir
# calling it like:
add_five(15) 
# will throw a "undefined function" error. You have to use the dot operator like:
add_five.(15)
```

You can also simplify this by using this syntax:

```elixir
add_five_2 = &(&1 + 5)
add_five_2.(15)
20
```
Here are ways we can apply functions with Enums:

```elixir
Enum.map([1, 2, 3], fn x -> x + 5 end)
Enum.map([1, 2, 3], &HelperMethods.add_five/1)
Enum.map([1, 2, 3], add_five_2)
Enum.map([1, 2, 3], &(&1 + 5))
```

## Lesson 11 | The Awesome |> Operator

## Enter |> 
If you want to apply multiple functions on a value such a string, you can following mutliple approaches:

Approach 1:
```elixir
s = "  hello "
trimmed_s = String.trim(s)
cap_trimmed_s = String.capitalize(trimmed_s)
rev_trimmed_s = String.reverse(cap_trimmed_s)
```

Approach 2:

```elixir
s = "  hello "
rev_trimmed_s = String.reverse(String.capitalize(String.trim(s)))
```

Approach 3:

```elixir
s = "  hello "
rev_trimmed_s = s 
                |> String.trim() 
                |> String.capitalize() 
                |> String.reverse()

```

**The return of one function should always be the input of the first arguement.**

## Example 2

```elixir 
my_map = %{vancouver: 15, toronto: 25, halifax: 20}

my_map |> Map.keys() |> Enum.map(fn c -> Atom.to_string(c) end)

capitalized_cities = my_map 
                     |> Map.keys() 
                     |> Enum.map(&Atom.to_string(&1)) 
                     |> Enum.map(&String.capitalize(&1))
```

## Lesson 16 | Using Case

To use case, we pass it a value or structure of sort and then we pattern match to control the flow of our application:

```elixir

my_var = 1
case my_var do

2 -> "It's the number 2"
"Hello" -> "It's the string Hello"
1 -> "It's the number 1"
_ -> "It's neither 1, 2 or Hello" # this is like an else statement, or a "catch all"
end
```

We can use pattern matching in all of it's forms:

```elixir

my_var = 1
case my_var do
"hello" <> _ -> "This string starts with hello"
_ -> "This string does not start with hello"
end
```

You will see this pattern a lot in Elixir:

```elixir
result = {:ok, :success}

{:ok, _} -> 
  "Success!!"
{:error, message} -> 
  "You got an error #{message}"
_ -> 
  "Unrecognized result"

```

You can also use guards with `case`:

```elixir
number = 15

case number do

x when x > 10 -> "The number is big."
y when y > 5 -> "The number is medium."
_ -> "The number is small."
end
```

You can also use case in series of |> operations:

``` elixir

defmodule MyModule do
def my_fun(), do: {:ok, :success}
end

MyModule.my_fun()
  |> case do
  {:ok, _} -> "Operations is a success"
  _ -> "Operations Failed"
  end
```

You mostly use case for readability. Generally speaking, favour using pattern matching whenever possible.

## Lesson 17 | Using Cond

Is useful when we don't want to pattern match. It's a lot more flexible than case.

``` elixir
cond do
 1 + 1 == 3 -> "block 1"
 1 + 1 == 2 -> "block 2"
 true -> "block 3"

end
```

Another example:

``` elixir
my_list = ["hello", 1, 2, nil]

cond do
Enum.count(my_list) == 3 -> "The length of the list is 3"
List.last(my_list) == 4 -> "The last element of the list is 4"
true -> "I don't know"
end
```

## Lesson 18 | Using If and Unless

We can use `if` when we want to check a single condition.

```elixir
list = [1, 2, 3]
if Enum.count(list) == 3 do
IO.puts "The list has three elements."
else
IO.puts "The list does not have three elements."
end
```

You can use `unless` as the opposite of `if` meaning that it will excute the code in its block if the condition returns `false`.

```elixir
list = [1, 2, 3]
unless Enum.count(list) == 3 do
"The list does not have three elements."
end
```

We can also use it to assign variables.

```elixir
list = [1, 2, 3, 4]
my word = if Enum.count(list) > 3 do
            "The list is big."
          else 
            "The list is small."
          end

my word = if Enum.count(list) > 3, do: "The list is big.", else: "The list is small."
```

### Variable Scoping

```elixir
list = [1, 2, 3, 4]
x = "hello"
if Enum.count(list) > 3 do
  x = "The list is big."
else 
  x = "The list is small."
end

IO.puts x # the x will be "hello", it follows block scoping

```

## Lesson 19 | Enumerable Comprehension

Basically using `for` to loop through enumerables.

``` elixir
list = [1, 2, 3, 4]

# Using Enum
Enum.each(list, fn x -> IO.puts x end)

#Using for comprehension
for  x <- do
IO.puts x
end
```

Generally speaking, favour the enum approach. It is often more readable in things like view files however, and more favourable there.

`for` works with other enumerables:

```elixir
for n <- 1..100 do
IO.puts n
end
```

It can also work with keyword lists:

```elixir
my_kl [a: 1, b: 2, c: 3]

for {x, y} <- my_kl do
IO.puts "the first item is #{x}"
IO.puts "the second item is #{y}"
```

## Lesson 20 | Project Set Up

To generate a new project:

  mix new <project_name>

This creates the project structure, with some boilerplate folders and files.

The `mix.exs` file is what defines your project. This is where you add all dependencies that you're using, for example.

The `.formatter.exs` is a file that can be updated to work with the `mix format` command. Essentially, it's rules that are called when the `mix format` command is run, that changes how you code is laid out depending on what you want. By default, it does things like removes extra indentations in your code.

### `.ex` versus `.exs`

All `.exs` files are files that do not get compiled, and get run on command. They are not part of your core compiled files, and are only used for files you want to run to accompish a particular purposes, such as scripts, tests, etc.

All `.ex` files do get compiled using BEAM with your main application.

Most of the code we're going to write is going to be in the `lib` directory. The tests will be written in the `tests` directory and any new dependencies we add are going to be added under the `deps` section in `mix.exs`.

## Lesson 21 | Project Organization

It's standard pratice to use `@moduledoc` to define what the purpose of a module is.

You can load up `iex` with all of your modules and all the libraries added using this command:

  iex -S mix

If you make changes and you need to recompile a module in `iex`:

  r <module_name>

There are three main ways to get functions from modules into different files.

1. Using `import`

Import the entire module using the module name:

  import Helper.Strings

Then when you call the function from the module you can simply call the function name directly like `titelize(name).

2. Calling it directly

  Helpers.Strings.titelize(name)

3. Using `alias`

Using alias we can access the module without using its fully qualified name. It lets you use the simpliest name. A module called `Helper.Strings` can be called as such:

  alias Helper.Strings

And now you can call the function using `Strings.titelize(name)`.

Note: aliases are frequently used to define shortcuts. Calling `alias` without an `:as` option (as seen above) sets the alias automatically to the last part of the module name.

## Lesson 22 | Testing and Documentation

It's a good idea to write test files to match the module name and append it with `_test`. It also needs to be an `.exs` file.

Elixir macros are constructs that give you extra functionality. 

Doctests do not automatically run and need to be called in the corresponding test files.

## Lesson 23 | Project Dependencies & Making HTTP Requests

To install dependencies, you can run `mix deps.get` after adding the dependency information into the `mix.exs` file.