class Event < ActiveRecord::Base
	include PublicActivity::Common

	validates :name, presence: true
	#validates :owner, presence: true
	validates :location, presence: true

	# Event Subscriptions
	has_many :subscriptions
	has_many :subscribers, through: :subscriptions, source: :user

	# Event Ownership
	has_many :event_ownerships
	has_many :owners, through: :event_ownerships, source: :user

	# Database look up name.
	self.table_name = "atw_rseventspro_events"
	self.per_page = 5

	# Simple tagging system
	def parse_tags
		gallery_tags.split(/\W+/)
	end

	# True if the event has already passed
	def has_passed?
		Time.zone.at(starttime) < Time.zone.now
	end
end
