defmodule WeWorkForBeer.APIKeyController do
  use WeWorkForBeer.Web, :controller

  alias WeWorkForBeer.APIKey
  alias WeWorkForBeer.Facebook
  alias WeWorkForBeer.User

  plug :action

  def create(conn, %{"authorizationCode" => auth_code}) do
    user_info = _exchange_auth_code_for_user_info(auth_code)
    user = Map.get(user_info, :uid)
    |> User.find_by_uid
    |> _update_or_create_user_by_uid(user_info)
    api_key = Repo.one assoc(user, :api_keys)

    render(conn, "show.json", api_key: api_key)
  end

  defp _exchange_auth_code_for_user_info(auth_code) do
    fb_info = Facebook.get_token!(code: auth_code)
    |> OAuth2.AccessToken.get!("/me")

    %{"id" => uid, "first_name" => first_name, "last_name" => last_name, "email" => email} = fb_info

    %{uid: uid, first_name: first_name, last_name: last_name, email: email}
  end

  defp _update_or_create_user_by_uid(nil, attributes) do
    changeset = User.changeset(%User{}, attributes)

    if changeset.valid? do
      Repo.transaction fn ->
        user = Repo.insert(changeset)
        APIKey.create_for(user)
      end
    end
  end

  defp _update_or_create_user_by_uid(user, attributes) do
    changeset = User.changeset(user, attributes)

    if changeset.valid? do
      Repo.update(changeset)
    end
  end
end
