defmodule SoundcloudEx.User.Favorite do
  import SoundcloudEx
  alias SoundcloudEx.Track

  def all(user_id, client) do
    get("/users/#{user_id}/favorites", client)
    |> Poison.decode!(as: [%Track{}])
  end

  def find(track_id, user_id, client) do
    get("/users/#{user_id}/favorites/#{track_id}", client)
    |> Poison.decode!(as: %Track{})
  end
end