require 'net/http'
require 'json'

# The API returns cryptocurrency data in JSON format that's why I am using (json library)
# Controller to fetch and display cryptocurrency data

class CryptosController < ApplicationController
  def index
    url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1"
    uri = URI(url)
    # Make HTTP GET request to the API
    response = Net::HTTP.get(uri)
    # Parse the JSON response
    @cryptos = JSON.parse(response)
  end
end
