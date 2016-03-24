defmodule OpenGraphx.Mixfile do
  use Mix.Project

  @description "Load Open Graph Protocol"

  def project do
    [app: :open_graphx,
     version: "0.0.2",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     description: @description,
     package: package
   ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :floki, :httpoison]]
  end

  defp package do
    [maintainers: ["Takuma Yoshida"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/yoavlt/open_graphx"},
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:floki, "~> 0.8"},
      {:httpoison, "~> 0.8.0"},
      {:ex_doc, "~> 0.8.0", only: :dev},
      {:earmark, ">= 0.0.0", only: :dev}
    ]
  end
end
