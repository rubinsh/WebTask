class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
    #Returns the currently logged in user or nil if there isn't one
    def current_user
      return unless session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end

    #Make current_user available in templates as a helper
    helper_method :current_user

    #Make logged_in? a helper method
    helper_method :logged_in?

    #Filter method to enforce login requirement
    #Apply as before_filter in any method you want to protect
    def authenticate
      logged_in? ? true : access_denied
    end

    def logged_in?
      current_user.is_a? User
    end


    def access_denied
      redirect_to login_path, :notice => "Please log in to continue" and false
    end
  
end
