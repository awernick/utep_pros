class Event < ActiveRecord::Base
	include PublicActivity::Common
	
	has_many :subscriptions
	has_many :subscribers, :through => :subscriptions, source: :user

	#Database look up name.
	self.table_name = "atw_rseventspro_events"

	#Simple tagging system
	def parse_tags
		gallery_tags.split(/\W+/)
	end

	self.per_page = 5

	def has_passed?
		Time.zone.at(starttime) < Time.zone.now
	end
end
