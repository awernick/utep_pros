class Event < ActiveRecord::Base
	#Database look up name.
	self.table_name = "atw_rseventspro_events"
	
	# Method for parsing the date to a readable format.
	# Require Ruby's date library
	require 'date'
	def parse_date

		# Convert date to string so that the method can work.
		parsedDate = Date.parse(starttime.to_s)

		# Separate the date elements to display them with commas and space.
		month = parsedDate.strftime('%B')
		day = parsedDate.strftime('%d')
		year = parsedDate.strftime('%Y')
		# Show the date as we want it.
		return month + " " + day + ", " + year
	end

	#Simple tagging system
	def parse_tags
		gallery_tags.split(/\W+/)
	end

	require 'time'
	def check_if_event_has_passed 
		#Get the time that the event is going to start and the current time
		timeRightNow = Time.new.to_i
		endingEventTime = self.endtime.to_i
		startEventTime = self.starttime.to_i

		#Compare the two times
		if startEventTime < timeRightNow and timeRightNow > endingEventTime
			answer = -1 
		elsif startEventTime > timeRightNow and endingEventTime > timeRightNow
			answer = 1
		elsif startEventTime <= timeRightNow and endingEventTime > timeRightNow
			answer =  0
		end
		return answer

		#CSS Toggling


	end

end
