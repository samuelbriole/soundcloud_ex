defmodule SoundcloudEx.User.Track do
  import SoundcloudEx
  alias SoundcloudEx.User

  defstruct [
    :id,
    :created_at,
    :user_id,
    :duration,
    :commentable,
    :state,
    :sharing,
    :tag_list,
    :permalink,
    :description,
    :streamable,
    :downloadable,
    :genre,
    :release,
    :purchase_url,
    :label_id,
    :label_name,
    :isrc,
    :video_url,
    :track_type,
    :key_signature,
    :bpm,
    :title,
    :release_year,
    :release_month,
    :release_day,
    :original_format,
    :original_content_size,
    :license,
    :uri,
    :permalink_url,
    :artwork_url,
    :waveform_url,
    :user,
    :stream_url,
    :download_url,
    :playback_count,
    :download_count,
    :favoritings_count,
    :comment_count,
    :attachments_uri,
# created_with
#   id
#   name
#   uri
#   permalink_url
  ]

  def all(user_id, client) do
    get("/users/#{user_id}/tracks", client)
    |> Poison.decode!(as: [__MODULE__])
    |> Enum.map(&link_user(&1))
  end

  defp link_user(track) do
    %{track | user: convert_user(track)}
  end

  defp convert_user(track) do
    track.user
    |> atomize_keys
  end

  defp atomize_keys(map) do
    for {key, val} <- map, into: %{}, do: {String.to_atom(key), val}
  end
end