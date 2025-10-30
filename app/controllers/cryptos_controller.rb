require 'net/http'
require 'json'

class CryptosController < ApplicationController
  def index
    url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    @cryptos = JSON.parse(response)
  end
end
