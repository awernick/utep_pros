class SessionsController < ApplicationController
	
	#TODO: Return to previous page
	def create
		user = User.from_sso(cookies[:UTEP_SE], cookies[:UTEP_SA])
		log_in(user) if user
		redirect_to root_url
	end

	def destroy
		log_out
		UTEPSSO.deauthenticate(cookies[:UTEP_SE], cookies[:UTEP_SA])
		redirect_to root_url
	end
end
