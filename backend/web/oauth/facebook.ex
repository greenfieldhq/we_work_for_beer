defmodule WeWorkForBeer.Facebook do
  use OAuth2.Strategy

  def new do
    OAuth2.new([
      strategy: __MODULE__,
      client_id: System.get_env("FACEBOOK_CLIENT_ID"),
      client_secret: System.get_env("FACEBOOK_CLIENT_SECRET"),
      redirect_uri: "http://localhost:4200/",
      site: "https://graph.facebook.com/v2.3",
      authorize_url: "https://www.facebook.com/dialog/oauth",
      token_url: "https://graph.facebook.com/oauth/access_token"
    ])
  end

  def get_token!(params \\ [], headers \\ []) do
    OAuth2.Client.get_token!(new(), params, headers)
  end

  def get_token(client, params, headers) do
    client
    |> put_header("Accept", "application/json")
    |> OAuth2.Strategy.AuthCode.get_token(params, headers)
  end
end
