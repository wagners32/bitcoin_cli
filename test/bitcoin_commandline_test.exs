defmodule BitcoinCommandlineTest do
  use ExUnit.Case
  doctest BitcoinCommandline

  import Mock

  test "bitcoin USD price" do
    with_mock :httpc, [request: fn(_url) -> 
        {:ok, 
          {
            {'HTTP/1.1', 200, 'OK'}, 
            [{'cache-control', 'public; max-age=60'},{'date', 'Wed, 14 Dec 2022 11:17:53 GMT'}], 
            '{"USD": {"15m": 17442.90,"last": 17442.91,"buy": 17442.92,"sell": 17442.93,"symbol": "ARS"}}'
          }
        } 
        end] do
        assert 17442.92 == BitcoinCommandline.get_price("USD")
    end
  end

  test "ticker url" do
    assert BitcoinCommandline.bitcoin_url() == "https://blockchain.info/ticker"
  end

end