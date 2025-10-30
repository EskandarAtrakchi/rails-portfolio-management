json.extract! portfolio, :id, :user_id, :asset_name, :symbol, :quantity, :notes, :created_at, :updated_at
json.url portfolio_url(portfolio, format: :json)
