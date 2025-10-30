class Portfolio < ApplicationRecord
  belongs_to :user

  validates :asset_name, presence: true
  validates :symbol, presence: true
  validates :quantity, presence: true,
                       numericality: { greater_than: 0, message: "must be a positive number" }
  # ⛔ Remove or comment out this line:
  # validates :price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
end
