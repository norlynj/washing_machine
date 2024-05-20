class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
        landing_page_path
    end

    def configure_permitted_parameters
        # Permit additional parameters for sign up (registration)
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :mobile_number, :gender, :birthday, :schedule_array, :schedule])
    end
end
