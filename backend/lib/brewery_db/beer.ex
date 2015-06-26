defmodule BreweryDB.Beer do
  import BreweryDB

  def find(id) do
    get_request("/beer/#{id}")
  end

  def list, do: get_request("/beers")
  def list(%{p: p}), do: get_request("/beers", %{p: p})
end
