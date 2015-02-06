class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  include SessionsHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

    # Redirects to login page if a user has not logged in  
    def logged_in_user
      unless logged_in?
        redirect_to login_path
      end
    end
end
