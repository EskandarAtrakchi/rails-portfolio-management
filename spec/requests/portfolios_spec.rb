require 'rails_helper'

RSpec.describe "Portfolios", type: :request do
  let(:user) { User.create!(first_name: "Test", last_name: "User", username: "tuser", email: "test@example.com", password: "password") }

  before do
    # simulate login
    post login_path, params: { email: user.email, password: "password" }
  end

  it "renders the index page" do
    get portfolios_path
    expect(response).to have_http_status(:ok)
  end

  it "creates a portfolio with valid data" do
    expect {
      post portfolios_path, params: { portfolio: { asset_name: "Bitcoin", symbol: "BTC", quantity: 2, price: 30000 } }
    }.to change(Portfolio, :count).by(1)
  end

  it "does not create a portfolio with missing fields" do
    expect {
      post portfolios_path, params: { portfolio: { asset_name: "", symbol: "", quantity: "" } }
    }.not_to change(Portfolio, :count)
  end
end
