defmodule SoundcloudEx.Track.Comment do
  import SoundcloudEx
  alias SoundcloudEx.Comment

  def all(track_id, client) do
    get("/tracks/#{track_id}/comments", client)
    |> Poison.decode!(as: [%Comment{}])
  end

  def find(comment_id, track_id, client) do
    get("/tracks/#{track_id}/comments/#{comment_id}", client)
    |> Poison.decode!(as: %Comment{})
  end

  def create(track_id, body, timestamp, client) do
    "/tracks/#{track_id}/comments"
    |> add_mandatory_params_to_url(client)
    |> post(client, ["comment[body]": body, "comment[timestamp]": timestamp])
    |> parse_response
    |> Poison.decode!(as: %Comment{})
  end

  def delete(comment_id, track_id, client) do
    delete("/tracks/#{track_id}/comments/#{comment_id}", client)
    :ok
  end
end