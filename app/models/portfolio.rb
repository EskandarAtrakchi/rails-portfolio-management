class Portfolio < ApplicationRecord
  belongs_to :user

  validates :asset_name, presence: true
  validates :symbol, presence: true
  validates :quantity, presence: true,
                       numericality: { greater_than: 0, message: "must be a positive number" }
end
