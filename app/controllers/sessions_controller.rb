class SessionsController < ApplicationController
	def create
		user = User.from_sso(cookies[:UTEP_SE], cookies[:UTEP_SA])
		if user
			session[:user_id] = user.id
		end
	end

	def destroy
		UTEPSSO.deauthenticate(cookies[:UTEP_SE])
		redirect_to root_url
	end

	helper_method :create
end