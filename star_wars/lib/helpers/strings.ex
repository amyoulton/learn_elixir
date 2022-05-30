defmodule Helpers.Strings do
  @moduledoc """
  This module provides handy string helpers
  """

  def titleize(string) do
    string
    |> String.split()
    |> Enum.map(&String.capitalize(&1))
    |> Enum.join(" ")
  end
end
