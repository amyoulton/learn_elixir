defmodule StarWars do
  # import Helpers.Strings

  alias Helpers.Strings

  @moduledoc """
  Documentation for `StarWars`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> StarWars.hello()
      :world

  """
  def hello do
    :world
  end

  @doc """

  This function greets by returning "Hello with titleizing input."

  ## Example:

  iex> StarWars.greeting("jen millar")
  "Hello Jen Millar"

  """

  def greeting(name) do
    "Hello #{Strings.titleize(name)}"
  end
end
