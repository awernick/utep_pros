class SessionsController < ApplicationController
	def create
		user = User.from_sso
		session[:user_id] = user.id
		redirect_to root_url
	end

	def destroy
		utep_cookie = cookies[:UTEP_SE]
		session[:user_id] = nil
		client = Savon.client(wsdl: 'http://websvs.utep.edu/databaseservices/public/ExternalSignon.asmx?wsdl')
		client.call(:log_off, message: { sessionId: utep_cookie.to_s})
		redirect_to root_url
	end
end
