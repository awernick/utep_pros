require 'utep_sso'

class User < ActiveRecord::Base
	#Add support for the messaging system
	acts_as_messageable

	has_many :subscriptions
	has_many :events, :foreign_key => 'owner'
	
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

			mailboxer_name_var = sso_response[:username]
			mailboxer_email_var = sso_response[:email_address]

			return user

		end
	end

	#User Identities for Mailbox
	def mailboxer_name
		# return[:full_name]
		return "gavargas"
	end
	def mailboxer_email
		# return user.email
		return "gavargas@miners.utep.edu"
	end
end
