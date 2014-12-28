class ActivitiesController < ApplicationController
	#{id:, trackable_id:, trackable_type:, owner_id:, owner_type:, key:, parameters:, recipient_id:, recipient_type:, created_at:, updated_at:}
	def index
		@activities = PublicActivity::Activity.order("created_at desc")
	end
end