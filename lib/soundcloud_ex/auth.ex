defmodule SoundcloudEx.Auth do
  import SoundcloudEx
  alias SoundcloudEx.Client

  @auth_path "/connect"

  def authorization_url(client, redirect_uri) do
    url_for(@auth_path, client)
    |> add_mandatory_params_to_url(client)
    |> add_params_to_url([
      "response_type": "code_and_token",
      "redirect_uri": URI.encode(redirect_uri)
    ])
  end
end