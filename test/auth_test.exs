defmodule SoundcloudEx.AuthTest do
  import SoundcloudEx.Auth
  alias SoundcloudEx.Client

  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "authorization_url/1" do
    client = Client.new(%{client_id: "MY_CLIENT_ID", client_secret: "MY_CLIENT_SECRET", redirect_uri: "http://localhost:4000/callback"})

    assert "https://api.soundcloud.com/connect?client_id=MY_CLIENT_ID&response_type=code_and_token&redirect_uri=http://localhost:4000/callback" == authorization_url(client)
  end
end
