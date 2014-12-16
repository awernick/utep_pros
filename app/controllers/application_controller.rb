class ApplicationController < ActionController::Base
  require 'savon'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  
  def current_user
    if session[:user_id]
      @curret_user = User.find(session[:user_id])
    end
  end

  helper_method :current_user
end
