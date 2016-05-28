defmodule SoundcloudEx.User.Following do
  import SoundcloudEx
  alias SoundcloudEx.User
  alias SoundcloudEx.PaginatedList

  def all(user_id, client, opts \\ %{}) do
    get("/users/#{user_id}/followings", client, opts)
    |> Poison.decode!(as: %PaginatedList{collection: [%User{}]})
    |> PaginatedList.decorate_with_pagination
  end
end