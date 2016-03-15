defmodule SoundcloudEx do
  use HTTPoison.Base
  alias SoundcloudEx.Client

  def get(path, client, params \\ %{}) do
    url_for(path, client)
    |> add_mandatory_params_to_url(client)
    |> add_params_to_url(params)
    |> get!
    |> parse_response
  end

  def post(path, client, params \\ []) do
    url_for(path, client)
    |> post!({:form, params})
    |> parse_response
  end

  def url_for(path, client) do
    client.endpoint <> path
  end

  def add_params_to_url(url, params \\ %{}) do
    <<url :: binary, "&", URI.encode_query(params) :: binary>>
  end

  def add_mandatory_params_to_url(url, %Client{client_id: client_id}) do
    <<url :: binary, start_query_string(%{"client_id": client_id}) :: binary>>
  end

  defp start_query_string(params) do
    to_string('?' ++ URI.encode_query(params))
  end

  def parse_response(response) do
    response.body
    |> Poison.decode!
  end
end
