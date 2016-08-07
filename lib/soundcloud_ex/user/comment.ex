defmodule SoundcloudEx.User.Comment do
  import SoundcloudEx
  alias SoundcloudEx.Comment

  def all(user_id, client, opts \\ %{}) do
    get("/users/#{user_id}/comments", client, opts)
    |> Poison.decode!(as: [%Comment{}])
  end
end