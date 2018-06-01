defmodule SoundcloudEx.Track do
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
    :attachments_uri
  ]


  # q                string       a string to search for (see search documentation)
  # tags             list         a comma separated list of tags
  # filter           enumeration  (all,public,private)
  # license          enumeration  Filter on license. (see license attribute)
  # bpm[from]        number       return tracks with at least this bpm value
  # bpm[to]          number       return tracks with at most this bpm value
  # duration[from]   number       return tracks with at least this duration (in millis)
  # duration[to]     number       return tracks with at most this duration (in millis)
  # created_at[from] date         return tracks created at this date or later
  # created_at[to]   date         return tracks created at this date or earlier
  # ids              list         a comma separated list of track ids to filter on
  # genres           list         a comma separated list of genres
  # types            enumeration  a comma separated list of types

  def search(filters, client) do
    SoundcloudEx.get("/tracks", client, filters)
    |> Poison.decode!(as: [%__MODULE__{}])
  end

  # gets a single track
  def get(id, client) do
    SoundcloudEx.get("/tracks/" <> to_string(id), client)
    |> Poison.decode!(as: %__MODULE__{})
  end

  def related(id, filters, client) do
    SoundcloudEx.get("/tracks/" <> to_string(id) <> "/related", client, filters)
    |> Poison.decode!(as: [%__MODULE__{}])
  end
end
