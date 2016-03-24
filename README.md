# OpenGraphx

 Get Open Graph Data from HTML

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add open_graphx to your list of dependencies in `mix.exs`:

        def deps do
          [{:open_graphx, "~> 0.0.1"}]
        end

  2. Ensure open_graphx is started before your application:

        def application do
          [applications: [:open_graphx]]
        end

## Usage
```elixir
  iex> OpenGraphx.load("http://qiita.com/yoavlt/items/407ab562de5eab87bdb8")

    %OpenGraphx{description: "[前回](http://qiita.com/yoavlt/items/2faa2107eedd8c82ff8f)の続き。\n今回はEcto.Queryableとクエリ合成、Migrationの詳細。\n\n適切な道具",
     image: "http://cdn.qiita.com/assets/qiita-fb-f1d6559f13f7e8de7260c6cec4d3b8f9c2eab8322a69fd786baea877d220278b.png",
     site_name: "Qiita",
     title: "Elixir Ectoのスキーマ定義と合成可能なクエリ - モジュールからデータベース用DSLへ - Qiita",
     type: "article", url: "http://qiita.com/yoavlt/items/407ab562de5eab87bdb8""}
```
