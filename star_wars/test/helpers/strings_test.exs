defmodule Helpers.StringsTest do
  use ExUnit.Case
  alias Helpers.Strings

  doctest Strings

  test "titlelizes a string" do
    Strings.titleize("hello world") == "Hello World"
  end
end
