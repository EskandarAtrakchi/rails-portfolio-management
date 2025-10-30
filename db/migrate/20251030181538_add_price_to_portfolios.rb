class AddPriceToPortfolios < ActiveRecord::Migration[8.0]
  def change
    add_column :portfolios, :price, :decimal
  end
end
