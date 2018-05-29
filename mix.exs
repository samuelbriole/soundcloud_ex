defmodule SoundcloudEx.Mixfile do
  use Mix.Project

  @description """
    SoundCloud api wrapper for Elixir
  """

  def project do
    [
      app: :soundcloud_ex,
      version: "0.0.1",
      elixir: "~> 1.1",
      name: "SoundCloudEx",
      description: @description,
      package: package(),
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: ["coveralls": :test, "coveralls.detail": :test, "coveralls.post": :test]
    ]
  end

  def application do
    [applications: [:httpoison]]
  end

  defp deps do
    [
      { :httpoison, "~> 0.11.1" },
      { :poison, "~> 3.0" },
      { :excoveralls, "~> 0.4", only: :test },
      { :exvcr, "~> 0.7", only: :test }
    ]
  end

  defp package do
    [
      maintainers: ["Gregorio Setti"],
      licenses: ["MIT"],
      links: %{ "Github" => "https://github.com/desmondhume/soundcloud_ex" }
    ]
  end
end
