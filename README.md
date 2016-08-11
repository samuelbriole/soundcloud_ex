# SoundcloudEx [![Build Status](https://travis-ci.org/desmondhume/soundcloud_ex.svg?branch=master)](https://travis-ci.org/desmondhume/soundcloud_ex) [![Coverage Status](https://coveralls.io/repos/github/desmondhume/soundcloud_ex/badge.svg?branch=master)](https://coveralls.io/github/desmondhume/soundcloud_ex?branch=master)

SoundCloud api wrapper for Elixir. It provides simple HTTP authentication methods and client for api calls.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add soundcloud_ex to your list of dependencies in `mix.exs`:

        def deps do
          [{:soundcloud_ex, "~> 0.0.1"}]
        end

##Examples
###OAuth2 authorization code flow
```elixir
client = SoundcloudEx.Client.new(%{
  client_id: YOUR_CLIENT_ID,
  client_secret: YOUR_CLIENT_SECRET,
  redirect_uri: YOUR_REDIRECT_URI
})
auth_url = SoundcloudEx.Auth.authorization_url(client)

# Once you've redirected the user to `auth_url`, the user will complete the authentication
# on the SoundCloud login page. After that, SoundCloud will redirect the user to the
# `REDIRECT_URI` you've set. That's where you'll exchange the code passed via query string
# by SoundCloud with a fully-fledged access token.

SoundcloudEx.Auth.exchange_token(client, params["code"])
```

### OAuth2 refresh token
```elixir
client = SoundcloudEx.Client.new(%{
  client_id: YOUR_CLIENT_ID,
  client_secret: YOUR_CLIENT_SECRET
})

SoundcloudEx.Auth.refresh_token(client, YOUR_REFRESH_TOKEN) # A new fully-fledged access token.
```

