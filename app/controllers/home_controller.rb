class HomeController < ApplicationController
  def index
    if user_signed_in?
      @total_value = current_user.portfolios.sum("quantity * price")
      @portfolio_count = current_user.portfolios.count
    end
  end

  def about
  end
end
