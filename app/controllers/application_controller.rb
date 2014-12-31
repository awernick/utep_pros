class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  require 'savon'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  
  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
    #Temporary user stuff
    return User.first
  end

  helper_method :current_user
end
