class HomeController < ApplicationController
  def index
    # Show total portfolio value and count if user is signed in
    if user_signed_in?
      # Calculate total portfolio value and count by using simple math on portfolios
      @total_value = current_user.portfolios.sum("quantity * price")
      # Get the number of unique cryptocurrencies in the portfolio
      @portfolio_count = current_user.portfolios.count
    end
  end

  # About page might not be needed, I will decide later 
  def about
  end
end
