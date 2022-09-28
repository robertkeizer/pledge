defmodule Pledge.MixProject do
  use Mix.Project

  def project do
    [
      app: :pledge,
      version: "0.0.1",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Doc
      name: "pledge",
      source_url: "https://github.com/robertkeizer/pledge",
      docs: [
        main: "readme",
        extras: ["README.md"]
      ],
      description: "This package exposes pledge(2) system call functionality available in OpenBSD",
      licenses: ["ISC"]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler, "~> 0.26.0"},
      {:ex_doc, "~> 0.28.5", only: :dev, runtime: false}
    ]
  end
end
