class Event < ActiveRecord::Base
	#Database look up name.
	self.table_name = "atw_rseventspro_events"
	
	#Simple tagging system
	def parse_tags
		gallery_tags.split(/\W+/)
	end

end
