defmodule BitcoinCommandlineTest do
  use ExUnit.Case
  doctest BitcoinCommandline

  test "ticker url" do
    assert BitcoinCommandline.bitcoin_url() == "https://blockchain.info/ticker"
  end

  test "bitcoin usd price" do
    assert 17442.92 == BitcoinCommandline.get_price("USD")
  end
  
end