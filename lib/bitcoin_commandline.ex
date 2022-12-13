defmodule BitcoinCommandline do
  def get_price(currency) do
    :inets.start()
    :ssl.start()

    bitcoin_url()
    |> :httpc.request
    |> extract_response
    |> exchange_rate(currency)
  end
  
  def bitcoin_url do
    "https://blockchain.info/ticker"
  end

  defp extract_response({:ok, {{_, 200, 'OK'}, _headers, body}} = _response) do
    {_status, list} = JSON.decode(body)
    list
  end

  defp extract_response({:ok, {{_, 404, 'Not Found'}, _headers, _body} } = _response) do 
    {:error, :not_found}
  end  

  defp exchange_rate(list_prices, currency) do
    list_prices["#{currency}"]["buy"]
  end
end
