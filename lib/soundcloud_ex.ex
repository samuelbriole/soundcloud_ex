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
  end

  def put(path, client) do
    url_for(path, client)
    |> add_mandatory_params_to_url(client)
    |> put!("")
    |> parse_response
  end

  def delete(path, client) do
    url_for(path, client)
    |> add_mandatory_params_to_url(client)
    |> delete!
    |> parse_response
  end

  def url_for(path, client) do
    client.endpoint <> path
  end

  def add_params_to_url(url, params \\ %{}) do
    <<url :: binary, "&", encode_params(params) :: binary>>
  end

  def encode_params(input, namespace) do
    Enum.map(input, fn({key, value}) -> encode_param("#{namespace}[#{key}]", value) end)
    |> Enum.join("&")
  end

  def encode_params(input) do
    Enum.map(input, fn({key, value}) -> encode_param(key, value) end)
    |> Enum.join("&")
  end

  defp encode_param(key, value) when is_map(value) do
    encode_params(value, key)
  end

  defp encode_param(key, value) when is_list(value) do
    encode_param(key, Enum.map(value, fn(tag) -> URI.encode(tag) end) |> Enum.join(","))
  end

  defp encode_param(key, value) do
    "#{key}=#{value}"
  end

  def add_mandatory_params_to_url(url, %Client{oauth_token: nil, client_id: client_id}) do
    <<url :: binary, start_query_string(%{"client_id": client_id}) :: binary>>
  end
  def add_mandatory_params_to_url(url, %Client{oauth_token: oauth_token, client_id: nil}) do
    <<url :: binary, start_query_string(%{"oauth_token": oauth_token}) :: binary>>
  end

  defp start_query_string(params) do
    to_string('?' ++ URI.encode_query(params))
  end

  def parse_response(%HTTPoison.Response{status_code: 200, body: ""}), do: nil
  def parse_response(%HTTPoison.Response{status_code: 200, body: body}), do: body
  def parse_response(%HTTPoison.Response{status_code: 201, body: body}), do: body
  def parse_response(%HTTPoison.Response{status_code: 303, body: body}), do: body
  def parse_response(%HTTPoison.Response{status_code: 404, body: ""}), do: raise SoundcloudEx.NotFoundError
  def parse_response(%HTTPoison.Response{status_code: status_code, body: ""}), do: { status_code, nil }
  def parse_response(%HTTPoison.Response{status_code: status_code, body: body }), do: { status_code, body }
end
