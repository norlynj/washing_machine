# app/controllers/users/sessions_controller.rb
class Users::SessionsController < Devise::SessionsController
  # POST /resource/sign_in
  def create
    user = User.find_by(email: params[:user][:email])

    # Check if user exists and is not inactive
    if user && user.status == 'deleted'
      # Optionally, you can set a flash message here to inform the user
      flash[:alert] = "Your account is inactive. Please contact support."
      redirect_to new_user_session_path
    else
      super
    end
  end
end
