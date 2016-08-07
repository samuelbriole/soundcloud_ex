defmodule SoundcloudEx.User.WebProfile do
  import SoundcloudEx

  defstruct [
    :id,
    :service,
    :title,
    :url,
    :username,
    :created_at
  ]

  def all(user_id, client) do
    get("/users/#{user_id}/web-profiles", client)
    |> Poison.decode!(as: [__MODULE__])
  end
end