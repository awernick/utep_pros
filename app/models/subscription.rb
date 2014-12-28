class Subscription < ActiveRecord::Base
	include PublicActivity::Common
  # tracked owner
  belongs_to :user
  belongs_to :event

	self.table_name = "atw_rseventspro_users"
end

