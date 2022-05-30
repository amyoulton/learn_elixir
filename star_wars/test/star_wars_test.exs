defmodule StarWarsTest do
  use ExUnit.Case
  doctest StarWars

  test "greets the world" do
    assert StarWars.hello() == :world
  end

  test "it greets by returning hello with titelized given string" do
    assert StarWars.greeting("john smith") == "Hello John Smith"
  end
end
