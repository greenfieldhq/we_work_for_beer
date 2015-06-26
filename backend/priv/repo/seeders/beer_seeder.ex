defmodule WeWorkForBeer.BeerSeeder do
  alias WeWorkForBeer.Beer
  alias WeWorkForBeer.Repo
  require IEx

  def seed do
    total_pages = BreweryDB.Beer.list
    |> Map.get("totalPages")

    _seed_pages(%{current_page: 1, total_pages: total_pages})
  end

  defp _seed_pages(%{current_page: current_page, total_pages: total_pages}) when current_page >= total_pages do
    IO.puts "All done."
  end

  defp _seed_pages(%{current_page: current_page, total_pages: total_pages}) do
    beer_list = BreweryDB.Beer.list(%{p: current_page})
    _seed_beer_list(beer_list)

    %{current_page: current_page + 1, total_pages: total_pages}
    |> _seed_pages
  end

  defp _seed_beer_list(list) do
    for beer_attrs <- Map.get(list, "data") do
      _seed_beer(beer_attrs)
    end
  end

  defp _seed_beer(attrs) do
    uid = Map.get(attrs, "id")

    Beer.find_by_uid(uid) || _create_beer(attrs)
  end

  defp _create_beer(api_attrs) do
    style = Map.get(api_attrs, "style") || %{}

    attrs = %{
      uid: Map.get(api_attrs, "id"),
      name: Map.get(api_attrs, "nameDisplay"),
      style: Map.get(style, "shortName"),
      abv: Map.get(api_attrs, "abv"),
      description: Map.get(api_attrs, "description"),
      icon_small: Map.get(api_attrs, "labels") |> _labels |> Map.get("icon"),
      icon_medium: Map.get(api_attrs, "labels") |> _labels |> Map.get("medium"),
      icon_large: Map.get(api_attrs, "labels") |> _labels |> Map.get("large"),
      brewery_name: hd(Map.get(api_attrs, "breweries")) |> Map.get("name")
    }

    Beer.changeset(%Beer{}, attrs)
    |> Repo.insert!
  end

  defp _labels(nil) do
    %{}
  end

  defp _labels(foo) do
    foo
  end

end

WeWorkForBeer.BeerSeeder.seed
