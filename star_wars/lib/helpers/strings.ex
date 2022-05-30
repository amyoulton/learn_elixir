defmodule Helpers.Strings do
  @moduledoc """
  This module provides handy string helpers
  """

  @doc """
  This function titleizes string by capitalizing each string.

  ## Example:

  iex> Strings.titleize("hello world")
  "Hello World"
  """
  def titleize(string) do
    string
    |> String.split()
    |> Enum.map(&String.capitalize(&1))
    |> Enum.join(" ")
  end
end
