defmodule SoundcloudEx.Auth do
  import SoundcloudEx
  alias SoundcloudEx.Client

  @auth_path "/connect"
  @token_path "/oauth2/token"

  def authorization_url(client) do
    url_for(@auth_path, client)
    |> add_mandatory_params_to_url(client)
    |> add_params_to_url([
      "response_type": "code_and_token",
      "redirect_uri": URI.encode(client.redirect_uri)
    ])
  end

  def exchange_token(client, code) do
    @token_path
    |> post(client, [
        code: code,
        grant_type: "authorization_code",
        redirect_uri: client.redirect_uri,
        client_id: client.client_id,
        client_secret: client.client_secret
      ])
  end
end