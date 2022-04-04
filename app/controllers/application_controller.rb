class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
        # @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def authorize
        redirect_to login_path, alert: 'You must be logged in to access this page.' if current_user.nil?
      end
end
