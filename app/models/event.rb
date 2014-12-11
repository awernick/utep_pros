class Event < ActiveRecord::Base
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

end
