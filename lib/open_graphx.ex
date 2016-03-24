defmodule OpenGraphx do

  defstruct description: nil, image: nil, site_name: nil, title: nil, type: nil, url: nil

  @doc """
  Load url and returns OpenGraphx data structure.

  iex> OpenGraphx.load("http://matome.naver.jp/odai/2140474323219875301")
      %OpenGraphx{description: "海外で行われているバスケットボールの練習動画を、今回はドリブルとハンドリングにしぼってまとめてみました。",
       image: "http://rr.img.naver.jp:80/mig?src=http%3A%2F%2Fcdn3-www.hoopsvibe.com%2Fassets%2Fuploads%2F2006%2F11%2Ffile_45069_0_arton36313.jpg&twidth=200&theight=200&qlt=80&res_format=jpg&op=r",
       site_name: "NAVER まとめ",
       title: "バスケットボール動画 〜ドリブル＆ハンドリング〜 - NAVER まとめ",
       type: "article", url: "http://matome.naver.jp/odai/2140474323219875301"}
  """
  def load(url, opts \\ []) do
    with {:ok, response} <- request(url, opts),
         {:ok, parsed}   <- parse(response), do: parsed
  end

  defp request(url, opts \\ []) do
    HTTPoison.start
    with {:ok, response} <- HTTPoison.get(url, [], opts),
         do: process_response(response)
  end

  defp process_response(%HTTPoison.Response{body: body, status_code: status_code}) when status_code in 200..299 do
    {:ok, body}
  end
  defp process_response(%HTTPoison.Response{body: body, status_code: _}), do: {:error, body}

  defp parse(html) do
    html
    |> Floki.find("head meta")
    |> Enum.filter(&exists_proeprty?/1)
    |> to_struct
  end

  defp exists_proeprty?({_, attributes, _}) do
    Enum.find(attributes,
      fn {"property", _} -> true
      _ -> false
    end) != nil
  end

  defp to_struct(body) do
    graph = body
            |> Enum.map(&prop_content/1)
            |> Enum.reduce(%OpenGraphx{}, &encode_node/2)
    {:ok, graph}
  end

  defp encode_node({"og:description", description}, graph) do
    %{graph | description: description}
  end
  defp encode_node({"og:image", image}, graph) do
    %{graph | image: image}
  end
  defp encode_node({"og:site_name", site_name}, graph) do
    %{graph | site_name: site_name}
  end
  defp encode_node({"og:title", title}, graph) do
    %{graph | title: title}
  end
  defp encode_node({"og:type", type}, graph) do
    %{graph | type: type}
  end
  defp encode_node({"og:url", url}, graph) do
    %{graph | url: url}
  end
  defp encode_node(_, graph), do: graph

  defp prop_content({"meta", args, _}) do
    args = Enum.into(args, Map.new)
    {args["property"], args["content"]}
  end
  defp prop_content(body) do
    IO.inspect "error: #{body}"
  end
end
