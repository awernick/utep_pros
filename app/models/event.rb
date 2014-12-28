class Event < ActiveRecord::Base
	include PublicActivity::Common
	
	has_many :subscriptions
	has_many :users, :through => :subscriptions
	
	#Database look up name.
	self.table_name = "atw_rseventspro_events"
	
	#Simple tagging system
	def parse_tags
		gallery_tags.split(/\W+/)
	end

	self.per_page = 5

end
