defmodule SoundcloudEx.Comment do
  defstruct [
    :id,
    :uri,
    :created_at,
    :body,
    :timestamp,
    :user_id,
    :user,
    :track_id
  ]
end
