defmodule SoundcloudEx.User.Track do
  import SoundcloudEx
  alias SoundcloudEx.Track

  def all(user_id, client) do
    get("/users/#{user_id}/tracks", client)
    |> Poison.decode!(as: [%Track{}])
  end
end