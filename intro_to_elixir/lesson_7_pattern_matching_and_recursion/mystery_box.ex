# MysteryBox.run([1, 2, 3, 4]) -> return 10

defmodule MysteryBox do
  # def sum([]) do
  #   0
  # end
  # Which can simply be written as:any()

  def sum([]), do: 0

  def sum([first_element | rest_of_list]) do
    first_element + sum(rest_of_list)
  end
end
