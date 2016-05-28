defmodule SoundcloudEx.User.Playlist do
  import SoundcloudEx
  alias SoundcloudEx.User

  defstruct [
    :id,
    :created_at,
    :user_id,
    :user,
    :title,
    :permalink,
    :permalink_url,
    :uri,
    :sharing,
    :embeddable_by,
    :purchase_url,
    :artwork_url,
    :description,
    :label,
    :duration,
    :genre,
    :tag_list,
    :label_id,
    :label_name,
    :release,
    :release_day,
    :release_month,
    :release_year,
    :streamable,
    :downloadable,
    :ean,
    :playlist_type
]

  def all(user_id, client) do
    get("/users/#{user_id}/playlists", client)
    |> Poison.decode!(as: [__MODULE__])
    |> Enum.map(&link_user(&1))
  end

  defp link_user(playlist) do
    %{playlist | user: convert_user(playlist)}
  end

  defp convert_user(playlist) do
    playlist.user
    |> atomize_keys
  end

  defp atomize_keys(map) do
    for {key, val} <- map, into: %{}, do: {String.to_atom(key), val}
  end
end