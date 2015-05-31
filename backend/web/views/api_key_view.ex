defmodule WeWorkForBeer.APIKeyView do
  use WeWorkForBeer.Web, :view

  def render("show.json", %{api_key: api_key}) do
    render_one(api_key, "api_key.json")
  end

  def render("api_key.json", %{api_key: api_key}) do
    %{
      access_token: api_key.access_token,
      token_type: "bearer"
    }
  end
end
