defmodule SoundcloudEx.Client do
  defstruct client_id: nil,
            client_secret: nil,
            auth_token: nil,
            endpoint: "https://api.soundcloud.com"

  def new(%{client_id: client_id, client_secret: client_secret}) do
    %__MODULE__{client_id: client_id, client_secret: client_secret}
  end
end