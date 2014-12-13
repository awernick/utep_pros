class ApplicationController < ActionController::Base
	require 'savon'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  
  def current_user
  	if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      @current_user = create_session_path
    end
    return @current_user
  end

  helper_method :current_user
end
