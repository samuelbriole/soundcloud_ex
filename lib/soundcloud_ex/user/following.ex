defmodule SoundcloudEx.User.Following do
  import SoundcloudEx
  alias SoundcloudEx.User
  alias SoundcloudEx.PaginatedList

  def all(user_id, client) do
    get("/users/#{user_id}/followings", client)
    |> Poison.decode!(as: %PaginatedList{collection: [%User{}]})
    |> PaginatedList.decorate_with_pagination
  end
end