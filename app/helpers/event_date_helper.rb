module EventDateHelper

	# Require Ruby's libraries used.
	require 'date'
	require 'time'

	# Method for parsing the date to a readable format.
  def parse_date (unparsedDate)
		# Convert date to string so that the method can work.
		parsedDate = Date.parse(unparsedDate.to_s)

		# Separate the date elements to display them with commas and space.
		parsedDate.strftime('%B %d, %Y')
	end

	def parse_date_for_calendar(date)
		parsed_date = Date.parse(date.to_s)
		#Formats date as YYYY-MM
		parsed_date.strftime('%Y-%m-%d')
	end

	def activity_format_date (span)
		time = Time.at(span)

		if span < 60
			unit = time.strftime("%S").to_i
			return "#{pluralize(unit,'second')} ago"
		elsif span < 3600
			unit = time.strftime("%M").to_i
			return "#{pluralize(unit,'minute')} ago"
		elsif span < 86400
			unit = time.strftime("%H").to_i
			return "#{pluralize(unit,'hour')} ago"
		elsif span < 31536000
			unit = time.strftime("%d").to_i
			return "#{pluralize(unit,'day')} ago"
		else
			unit = time.strftime("%y").to_i
			return "#{pluralize(unit,'year')} ago"
		end
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

	def parse_time_accounting_for_timezone (unparsedUTCTStartTime)

		# Get the starte event time and then parse it.

		#Obtain the local machine's time zone
		localTimeZone = Time.zone

		#Parse the time object and then apply the local time zone.
		parsedTime = DateTime.parse(unparsedUTCTStartTime.to_s)
		zonedTime = parsedTime.in_time_zone(localTimeZone).strftime("%I:%M%p")

		return zonedTime
	end
end