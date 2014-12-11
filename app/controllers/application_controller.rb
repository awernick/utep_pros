class ApplicationController < ActionController::Base
	require 'savon'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id] else user_from_sso
  end

  def user_from_sso
		utep_cookie = cookies[:UTEP_SE]
		utep_salt = cookies[:UTEP_SA]

		if utep_cookie && utep_salt
			client = Savon.client(wsdl: 'http://websvs.utep.edu/databaseservices/public/ExternalSignon.asmx?wsdl')
			response = client.call(:get_user_by_ssiu, message: { sessionId: utep_cookie, salt: utep_salt, ipAdress: request.host, userAgent: request.user_agent})
			user.name = response.body[:get_user_by_ssiu_response][:FullName]
			user.username = response.body[:get_user_by_ssiu_response][:UserName]
			user.email = response.body[:get_user_by_ssiu_response][:EmailAddress]
			user.save!
		end
  end

  helper_method :current_user
end
