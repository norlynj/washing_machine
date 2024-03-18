class ApplicationController < ActionController::Base

    def after_sign_in_path_for(resource)
        landing_page_path
    end
end
