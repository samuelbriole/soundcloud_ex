defmodule SoundcloudEx.Track.Favoriter do
  import SoundcloudEx
  alias SoundcloudEx.User

  def all(track_id, client) do
    get("/tracks/#{track_id}/favoriters", client)
    |> Poison.decode!(as: [%User{}])
  end

  def find(favoriter_id, track_id, client) do
    get("/tracks/#{track_id}/favoriters/#{favoriter_id}", client)
    |> Poison.decode!(as: %User{})
  end
end