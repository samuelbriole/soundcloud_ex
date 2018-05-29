defmodule SoundcloudEx.PaginatedList do
  defstruct [
    :collection,
    :next_href,
    :cursor
  ]

  def decorate_with_pagination(paginated_list) do
    %__MODULE__{
      collection: paginated_list.collection,
      next_href: paginated_list.next_href,
      cursor: cursor(paginated_list)
    }
  end

  def cursor(%__MODULE__{next_href: next_href}) do
    next_href
    |> parse_query_string
    |> Map.get("cursor")
  end

  def is_last_page(%__MODULE__{cursor: cursor}), do: is_nil cursor

  defp parse_query_string(nil), do: %{}
  defp parse_query_string(href) do
    href
    |> String.split("?")
    |> List.last
    |> URI.decode_query
  end
end
