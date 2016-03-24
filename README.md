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
  iex> OpenGraphx.load("http://matome.naver.jp/odai/2140474323219875301")

    %OpenGraphx{description: "海外で行われているバスケットボールの練習動画を、今回はドリブルとハンドリングにしぼってまとめてみました。",
     image: "http://rr.img.naver.jp:80/mig?src=http%3A%2F%2Fcdn3-www.hoopsvibe.com%2Fassets%2Fuploads%2F2006%2F11%2Ffile_45069_0_arton36313.jpg&twidth=200&theight=200&qlt=80&res_format=jpg&op=r",
     site_name: "NAVER まとめ",
     title: "バスケットボール動画 〜ドリブル＆ハンドリング〜 - NAVER まとめ",
     type: "article", url: "http://matome.naver.jp/odai/2140474323219875301"}
```
