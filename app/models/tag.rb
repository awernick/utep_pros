class Tag < ActiveRecord::Base
		#Create associations between events and tags through Active Record
		has_many :taggings
		has_many :events, through: :taggings
end
