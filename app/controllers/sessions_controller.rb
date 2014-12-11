class SessionsController < ApplicationController
	def create
		user = User.from_sso
		session[:user_id] = user.id
		redirect_to root_url
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end

	helper_method: create
end
