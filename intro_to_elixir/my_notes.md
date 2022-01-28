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