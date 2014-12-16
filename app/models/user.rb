require 'utep_sso'

class User < ActiveRecord::Base

	self.table_name = "atw_users"

	def self.from_sso(utep_cookie, utep_salt)
		user = User.new
    
    sso_response = UTEPSSO.authenticate(utep_cookie, utep_salt)

		if User.find_by_username(sso_response[:user_name])
			User.find_by_username(sso_response[:user_name])  
		else
			user.name = sso_response[:full_name]
			user.username = sso_response[:user_name]
			user.email = sso_response[:email_address]
			user.params = " "
			user.save!
			return user
		end
	end
end
