defmodule StarWars do
  @moduledoc """
  Documentation for `StarWars`.
  """
  alias Helpers.Strings

  @doc """

  This function greets by returning "Hello with titleizing input."

  ## Example:

  iex> StarWars.greeting("jen millar")
  "Hello Jen Millar"

  """

  def greeting(name) do
    "Hello #{Strings.titleize(name)}"
  end

  def fetch_person_info_by_id(id) do
    HTTPoison.start()

    "https://swapi.dev/api/people/#{id}"
    |> HTTPoison.get!()
    |> handle_api_res
  end

  def handle_api_res(%HTTPoison.Response{body: body, status_code: 200}) do
    IO.puts("SUCCESS")
    IO.puts(body)
  end

  def handle_api_res(%HTTPoison.Response{body: body, status_code: 404}) do
    IO.puts("RESOURCE NOT FOUND")
    IO.puts(body)
  end

  def handle_api_res(_) do
    "Something went wrong."
  end
end
