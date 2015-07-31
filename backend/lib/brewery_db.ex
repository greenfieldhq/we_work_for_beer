defmodule BreweryDB do
  use HTTPoison.Base

  defp process_url(url) do
    "http://api.brewerydb.com/v2/" <> url
  end

  def get_request(url, params \\ %{}) do
    params = Map.merge(default_params, params)

    {:ok, %HTTPoison.Response{body: body}} = get(url, [], params: params)

    body
  end

  defp process_response_body(body) do
    body |> Poison.decode!
  end

  defp default_params do
    %{key: Application.get_env(:brewery_db, :api_key), withBreweries: "Y"}
  end
end
