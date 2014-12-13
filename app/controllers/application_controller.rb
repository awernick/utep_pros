class ApplicationController < ActionController::Base
	require 'savon'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  
  def current_user
  	if session[:user_id]
      @curret_user = User.find(session[:user_id])
    else
      @current_user = User.from_sso(cookies[:UTEP_SE], cookies[:UTEP_SA])
        if @current_user
          session[:user_id] = @current_user.id
        end
      return @current_user
    end
  end

  helper_method :current_user
end
