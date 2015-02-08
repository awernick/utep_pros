require 'utep_sso'

class User < ActiveRecord::Base
	extend FriendlyId
	friendly_id :username, use: :slugged


	self.table_name = "atw_users"

	validates :username, presence: true
	validates :name, presence: true
	validates :email, presence: true

	# Event Subscriptions
	has_many :subscriptions
	has_many :subscribed_events, through: :subscriptions, source: :event

	# Event Ownership
	has_many :event_ownerships
	has_many :owned_events, through: :event_ownerships, source: :event

	# Add support for the messaging system
	acts_as_messageable


	# Return a User with SSO information
	def self.from_sso(utep_cookie, utep_salt)
		sso_response = UTEPSSO.authenticate(utep_cookie, utep_salt)

		user ||= User.find_by(username: sso_response[:user_name])

		unless user
			user.name = sso_response[:full_name]
			user.username = sso_response[:user_name]
			user.slug = sso_response[:user_name]
			user.email = sso_response[:email_address]
			user.params = " "
			user.save!

			mailboxer_name_var = sso_response[:username]
			mailboxer_email_var = sso_response[:email_address]
		end

		return user
	end

# User Identities for Mailbox
	def mailboxer_name
		# return[:full_name]
		return current_user.email
	end

	def mailboxer_email(object)
		# return user.email
		return current_user.email
	end

# Event Methods

	# Subscribes to an event
	def subscribe(event)
		subscriptions.create(event_id: event.id)
	end

	# Unsubscribes from event
	def unsubscribe(event)
		subscriptions.find_by(event_id: event.id).destroy
	end

	# Returns true if current user is subscribed to the event
	def subscribed?(event)
		subscribed_events.include?(event)
	end

	# Own an event
	def own(event)
		event_ownerships.create(event_id: event.id)
	end

	# Stop owning an event
	def disown(event)
		event_ownerships.find_by(event_id: event.id).destroy
	end

	# Returns true if current_user owns the event
	def owns?(event)
		owned_events.include?(event)
	end
end
