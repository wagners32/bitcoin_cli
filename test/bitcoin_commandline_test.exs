defmodule BitcoinCommandlineTest do
  use ExUnit.Case
  doctest BitcoinCommandline

  test "ticker url" do
    assert BitcoinCommandline.ticker_url == "https://blockchain.info/ticker"
  end

  
end
