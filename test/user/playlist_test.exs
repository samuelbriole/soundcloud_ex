defmodule SoundcloudEx.User.PlaylistTest do
  import SoundcloudEx.User.Playlist

  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "all/2" do
    use_cassette "user/playlist#all" do
      client = SoundcloudEx.Client.new(%{client_id: "MY_CLIENT_ID"})
      [%SoundcloudEx.Playlist{title: title} | _] = all(3207, client)

      assert "Concerts" == title
    end
  end
end
