defmodule SoundcloudEx.User.TrackTest do
  import SoundcloudEx.User.Track

  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "all/2" do
    use_cassette "user/track#all" do
      client = SoundcloudEx.Client.new(%{client_id: "MY_CLIENT_ID"})
      [%SoundcloudEx.Track{title: title} | _] = all(3207, client)

      assert "Group Recorder Test" == title
    end
  end
end
