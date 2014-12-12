class User < ActiveRecord::Base

	self.table_name = "atw_users"

	def self.user_from_sso
		utep_cookie = cookies[:UTEP_SE]
		utep_salt = cookies[:UTEP_SA]

		if utep_cookie && utep_salt
			client = Savon.client(wsdl: 'http://websvs.utep.edu/databaseservices/public/ExternalSignon.asmx?wsdl')
			response = client.call(:get_user_by_ssiu, message: { sessionId: utep_cookie.to_s, salt: utep_salt.to_s })

			#{:get_user_by_ssiu_result=>{:user_name=>"awernick", :full_name=>"Alan Wernick, :email_address=>"awernick@miners.utep.edu", :authenticated=>true, :role_value=>"1080", :external_user=>false}, :@xmlns=>"http://tempuri.org/"}
			if response.body[:get_user_by_ssiu_response][:get_user_by_ssiu_result][:authenticated]
				sso_response = response.body[:get_user_by_ssiu_response][:get_user_by_ssiu_result]
				if User.find_by_username(sso_response[:user_name])
					user ||= User.find_by_username(sso_response[:user_name])  
				else 
					user = User.new
					user.name = sso_response[:full_name]
					user.username = sso_response[:user_name]
					user.email = sso_response[:email_address]
					user.params = " "
					user.save!
				end
				session[:user_id] = user.id
				return user
			end
		end
	end
end
