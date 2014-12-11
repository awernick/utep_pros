class Event < ActiveRecord::Base
	#Database look up name.
	self.table_name = "atw_rseventspro_events"
	
	# Method for parsing the date to a readable format.
	# Require Ruby's date library
	require 'date'
	def parse_date (unparsedDate)

		# Convert date to string so that the method can work.
		parsedDate = Date.parse(unparsedDate.to_s)

		# Separate the date elements to display them with commas and space.
		month = parsedDate.strftime('%B')
		day = parsedDate.strftime('%d')
		year = parsedDate.strftime('%Y')
		# Show the date as we want it.
		return month + " " + day + ", " + year
	end

	#Create associations between events and tags through Active Record
	has_many :taggings
	has_many :tags, through: :taggings

	#Code that handles the creation of tags
	def all_tags=(names)
		self.tags = name.split(",").map do |name|
			Tag.where(name: name.strip).first_or_create!
		end
	end

	def all_tags
		self.tags.map(&:name).join(", ")
	end

end
