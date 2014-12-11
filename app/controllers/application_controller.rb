class ApplicationController < ActionController::Base
    protect_from_forgery
    helper_method :current_user, :logged_in?, :admin?

    def current_user
        # Note: we want to use "find_by_id" because it's OK to return a nil.
        # If we were to use User.find, it would throw an exception if the user can't be found.
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end


    #user must be logged in and admin to access certain resources
    def check_authorization
        if logged_in?
            if current_user.is_admin == false
                redirect_to(root_url)
            end
        else
            redirect_to(root_url)
        end
    end

    def logged_in?
        current_user != nil
    end

    def admin?
        current_user.is_admin == true
    end

    def require_login
        unless logged_in?
            flash[:error] = "You must be logged in to access this section"
            redirect_to log_in_url
        end
    end
end
