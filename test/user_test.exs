defmodule SoundcloudEx.UserTest do
  import SoundcloudEx.User

  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "me/1" do
    use_cassette "user#me" do
      client = SoundcloudEx.Client.new(%{oauth_token: "MY_AUTH_TOKEN"})
      %SoundcloudEx.User.Me{permalink: permalink} = me(client)

      assert "gregoriosetti" == permalink
    end
  end

  test "find/2" do
    use_cassette "user#find" do
      client = SoundcloudEx.Client.new(%{client_id: "MY_CLIENT_ID"})
      %SoundcloudEx.User{permalink: permalink} = find(2976616, client)

      assert "flume" == permalink
    end
  end

  test "search/2" do
    use_cassette "user#search" do
      client = SoundcloudEx.Client.new(%{client_id: "MY_CLIENT_ID"})
      [%SoundcloudEx.User{permalink: permalink} | _] = search("flume", client)

      assert "flume" == permalink
    end
  end

  test "follow/2" do
    use_cassette "user#follow" do
      client = SoundcloudEx.Client.new(%{oauth_token: "MY_AUTH_TOKEN"})

      assert :ok == follow(2976616, client)
    end
  end

  test "unfollow/2" do
    use_cassette "user#unfollow" do
      client = SoundcloudEx.Client.new(%{oauth_token: "MY_AUTH_TOKEN"})

      assert :ok == unfollow(2976616, client)
    end
  end
end
