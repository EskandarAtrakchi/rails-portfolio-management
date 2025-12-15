class ApplicationController < ActionController::Base
  helper_method :current_user, :user_signed_in?
  # make current_user and user_signed_in? available in views
  def current_user
    #try to find the user by user ID if session user ID returns (true)
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  # check if a user is signed in
  def user_signed_in?
    # check if current_user is present (true/false)
    current_user.present?
  end
  
  def authenticate_user!
    # redirect to login page if user is not signed in 
    unless user_signed_in?
      redirect_to login_path, alert: "Please login first."
    end
  end
end
