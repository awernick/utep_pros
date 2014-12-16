module EventDateHelper

	# Require Ruby's libraries used.
	require 'date'
	require 'time'

	# Method for parsing the date to a readable format.
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

	def check_if_event_has_passed

		#Get the time that the event is going to start and the current time
		timeRightNow = Time.new.to_i
		endingEventTime = @event.endtime.to_i
		startEventTime = @event.starttime.to_i

		#Compare the two times
		if startEventTime < timeRightNow and timeRightNow > endingEventTime
			answer = -1
		elsif startEventTime > timeRightNow and endingEventTime > timeRightNow
			answer = 1
		elsif startEventTime <= timeRightNow and endingEventTime > timeRightNow
			answer =  0
		end
		return answer
	end

	def parse_time_accounting_for_timezone (unparsedUTCTStartTime, unparsedUTCTEndTime)

		#unparsedUTCTStartTime.
		
		# # Get start time and parse it.
		# #parsedUTCStartTime = DateTime.new(unparsedUTCTStartTime.to_s).in_time_zone(localTimeZone)
		# #parsedUTCStartTime = Time.parse(unparsedUTCTStartTime).in_time_zone(localTimeZone)

		# #Get end time and parse it.
		# parsedUTCEndTime = DateTime.new(unparsedUTCTEndTime.to_s).in_time_zone(localTimeZone)
		# #parsedUTCEndTime = Time.parse(unparsedUTCTEndTime).in_time_zone(localTimeZone)

		# # Separate time into elements.
		# parsedStartHours = parsedUTCStartTime.strptime('%l')
		# parsedStartMinutes = parsedUTCStartTime.strptime('%M')

		# parsedEndHours = parsedUTCEndTime.strptime('%l')
		# parsedEndMinutes = parsedUTCEndTime.strptime('%M')

		#return parsedStartHours, parsedStartMinutes, parsedEndHours, parsedEndMinutes
	end
end