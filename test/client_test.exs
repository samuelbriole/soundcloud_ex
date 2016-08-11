defmodule SoundcloudEx.ClientTest do
  alias SoundcloudEx.Client

  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "new/1" do
    %Client{client_id: client_id, client_secret: client_secret, redirect_uri: redirect_uri} = Client.new(%{
      client_id: "MY_CLIENT_ID",
      client_secret: "MY_CLIENT_SECRET",
      redirect_uri: "http://localhost:4000/callback"
    })

    assert "MY_CLIENT_ID" = client_id
    assert "MY_CLIENT_SECRET" = client_secret
    assert "http://localhost:4000/callback" = redirect_uri

    %Client{client_id: client_id, client_secret: client_secret} = Client.new(%{
      client_id: "MY_CLIENT_ID",
      client_secret: "MY_CLIENT_SECRET",
    })

    assert "MY_CLIENT_ID" = client_id
    assert "MY_CLIENT_SECRET" = client_secret
  end
end
