# Intro to Elixir

## Lesson 1 | Hello, World

You can run files in the terminal by typing `elixir <filename>`.

## Lesson 2 | Immutability

Immutable = once you've set that data in memory, you cannot change it.

If multiple process are going to look at the same point in memory, it can cause issues. Process one might mutate it but process two would be looking for the data before mutating it.

The solution: to make a "copy" of the data, so the original data still exists for other processes.

Multi-threaded program is becoming more and more necessary.

With Elixir, you'll see a lot of functions calling other functions calling other functions.

JavaScript uses a single thread so mutating data is not an issue. Using mutiple threads is where the issue lies.

Given the same languages, it can be a bit slower. In some cases, you'll be copying data over and over. In most cases the gain is worth it.

### Tam's Notes

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

### Tam's Notes

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

a = { 1, 2}
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

## Pattern Matching & Recursion

Recursive function that calls itself. The most important thing when writing a rescursive function is that there must be a case where the recursion stops, otherwise you get stack overflow.

Stack: last in first out data structure. Function calls are put in the stack memory.

I find it easiest to split the problem into a recursive definition before writing code.

`sum([1, 2, 3, 4])` can be written as 1 + `sum([2, 3, 4])` which can be written can be written as `1 + 2 + sum([2, 3])` which can be written as `1 + 2 + 3 + 4 + sum([])`. We have to define that the sum of an empty array is 0. Consequently, `1 + 2 + 3 + 4 + 0` which will return 10.

Recursion is generally a great way to work with immutable data structures.

In many ways, pattern matching is the preferred way to control the flow of the application.

