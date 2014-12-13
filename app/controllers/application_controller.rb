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
      @current_user = create_session
    end
    return @current_user
  end

  def create_session
    puts "Creating Session"
    user = User.from_sso(cookies[:UTEP_SE], cookies[:UTEP_SA])
    if user
      session[:user_id] = user.id
    end
    return user
  end

  def session_destroy
    puts "Destroying Session"
    utep_cookie = cookies[:UTEP_SE]
    session[:user_id] = nil
    client = Savon.client(wsdl: 'http://websvs.utep.edu/databaseservices/public/ExternalSignon.asmx?wsdl')
    client.call(:log_off, message: { sessionId: utep_cookie.to_s})
    redirect_to root_url
  end

  helper_method :session_destroy
  helper_method :current_user
end
