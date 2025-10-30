require 'rails_helper'

RSpec.describe Portfolio, type: :model do
  it "is invalid without an asset_name" do
    portfolio = Portfolio.new(symbol: "BTC", quantity: 1, price: 10000)
    expect(portfolio).not_to be_valid
  end

  it "is valid with all required attributes" do
    user = User.create!(
      first_name: "John", last_name: "Doe", username: "jdoe",
      email: "jdoe@example.com", password: "password"
    )
    portfolio = user.portfolios.build(asset_name: "Bitcoin", symbol: "BTC", quantity: 2, price: 10000)
    expect(portfolio).to be_valid
  end

  it "requires quantity to be greater than zero" do
    user = User.create!(
      first_name: "Jane", last_name: "Smith", username: "jsmith",
      email: "jsmith@example.com", password: "password"
    )
    portfolio = user.portfolios.build(asset_name: "Ethereum", symbol: "ETH", quantity: 0, price: 2000)
    expect(portfolio).not_to be_valid
  end
end
