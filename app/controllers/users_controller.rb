class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]


  def index
    if params[:search].present?
      @users = User.where("first_name LIKE ? OR last_name LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%").where(role: :staff)
    else
      @users = User.where(role: :staff)
    end
  end

  def show
    @user = User.find(params[:id])
  end

  # creates user using the permitted params
  def create
    @password = generate_password
    @user = User.new(name: user_params[:name], email: user_params[:email], password: @password, role: user_params[:role], label_id: user_params[:label_id])
    if @user.save
      # Handle successful user creation
      redirect_to users_path, notice: 'User was successfully created.'
    else
      # Handle validation errors
      redirect_to users_path, alert: 'Failed to create user.'
    end
  end

  # update user using the id
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # Handle successful user update
      redirect_to users_path, notice: 'User was successfully updated.'
    else
      # Handle validation errors
      flash.now[:alert] = 'Failed to update user.'
      redirect_to users_path
    end
  end

  # deletes a user
  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path, notice: 'User successfully deleted.'
  end

  def logout
    sign_out(current_user) # Devise method to sign out the user
    redirect_to new_user_session_path # Redirect to the sign-in page
  end

  private

  # Generate a secure random password using rails helper
  def generate_password
    @password = SecureRandom.alphanumeric(8)
  end

 # Permits the name, email, and password parameters for user creation and update
  def user_params
    params.permit(:name, :email, :authenticity_token, :role, :label_id)
  end
end