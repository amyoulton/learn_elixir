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