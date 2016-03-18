defmodule SoundcloudEx.User do
  import SoundcloudEx
  alias SoundcloudEx.User.Me

  defstruct [
    :id,
    :permalink,
    :username,
    :uri,
    :permalink_url,
    :avatar_url,
    :country,
    :full_name,
    :city,
    :description,
    :discogs,
    :myspace,
    :website,
    :website,
    :online,
    :track_count,
    :playlist_count,
    :followers_count,
    :followings_count,
    :public_favorites_count,
    :avatar_data
  ]

  def me(client) do
    get("/me", client)
    |> Poison.decode!(as: Me)
  end
end