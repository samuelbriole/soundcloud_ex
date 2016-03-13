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
      package: package,
      deps: deps
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    []
  end

  defp package do
    [
      maintainers: ["Gregorio Setti"],
      licenses: ["MIT"],
      links: %{ "Github" => "https://github.com/desmondhume/soundcloud_ex" }
    ]
  end
end
