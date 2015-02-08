class EventOwnership < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validates :user_id, presence: true
end
