class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    # Handle login logic
    if user.nil?
      flash.now[:alert] = "No account found with that email."
      render :new, status: :unprocessable_entity
    elsif user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully."
    else
      flash.now[:alert] = "Incorrect password. Please try again."
      render :new, status: :unprocessable_entity
    end
  end
  # Logout action
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out successfully."
  end
end
