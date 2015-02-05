class SessionsController < ApplicationController
	
	#TODO: Return to previous page
	def create
		user = User.from_sso(cookies[:UTEP_SE], cookies[:UTEP_SA])
		session[:user_id] = user.id if user
		redirect_to root_url
	end

	def destroy
		session[:user_id] = nil
		UTEPSSO.deauthenticate(cookies[:UTEP_SE], cookies[:UTEP_SA])
		redirect_to root_url
	end
end
