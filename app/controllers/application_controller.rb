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


  def sso_signout
    utep_cookie = cookies[:UTEP_SE]
    session[:user_id] = nil
    client = Savon.client(wsdl: 'http://websvs.utep.edu/databaseservices/public/ExternalSignon.asmx?wsdl')
    client.call(:log_off, message: { sessionId: utep_cookie.to_s})
  end

  helper_method :sso_signout
  helper_method :current_user
end
