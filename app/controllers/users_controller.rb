class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[new create]
  before_action :set_user, only: %i[show edit update destroy]
  before_action :authorize_user!, only: %i[edit update destroy]

  def show; end
  # GET /users/new
  def new
    @user = User.new
  end
  # POST /users
  def create
    @user = User.new(user_params)
    # Attempt to save the new user
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Account created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end
  # GET /users/1/edit
  def edit; end

 def update
    if @user.update(user_params)
      redirect_to @user, notice: "Profile updated successfully!"
    else
      flash.now[:alert] = "Please correct the errors below."
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Account deleted."
  end
  
  private
    
    def set_user
      @user = User.find(params[:id])
    end
    # Ensure only the profile owner can edit, update, or destroy their profile
    def authorize_user!
      redirect_to root_path, alert: "You can only edit your own profile." unless @user == current_user
    end
    # Strong parameters for user
    def user_params
      params.require(:user).permit(
        :first_name, :last_name, :username, :email,
        :password, :password_confirmation,
        :phone_number, :bio, :profile_image_url
      )
    end
end
