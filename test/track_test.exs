defmodule SoundcloudEx.TrackTest do
  import SoundcloudEx.Track

  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "search/2" do
    use_cassette "track#search" do
      client = SoundcloudEx.Client.new(%{client_id: "MY_CLIENT_ID"})
      [%SoundcloudEx.Track{title: title} | _] = search(%{duration: %{from: 30000, to: 35000}}, client)

      assert "Break Time" == title
    end
  end
end
