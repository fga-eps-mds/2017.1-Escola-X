module ReaderHelper

	TWO_POINTS = ":"
	DATE_SPACE = "/"
	SPACE_TRACE_SPACE = "-"
	ADJUSTING_FUSE_TO_BRAZILIAN = 3;
	ZERO = "0";
	SINGLE_CHAR = 1


	def mountCurrentDate() 
	
 		
 		day = Time.current.day.to_s
 		month = Time.current.month.to_s
 		year = Time.current.year.to_s 

 		if (month.length == SINGLE_CHAR)
 			month = ZERO + month
 		end

 		if (day.length == SINGLE_CHAR)
 			day = ZERO + day
 		end

 		correctDate = year + SPACE_TRACE_SPACE + month + SPACE_TRACE_SPACE + day 
		return correctDate.to_s
	end

	def mountCurrentTime()
		hour = (Time.current.hour - ADJUSTING_FUSE_TO_BRAZILIAN).to_s
 		minutes = Time.current.min .to_s

 		if (hour.length == SINGLE_CHAR)
 			hour = ZERO + hour
 		end

 		if (minutes.length == SINGLE_CHAR)
 			minutes = ZERO + minutes
 		end

 		correctTime = hour + TWO_POINTS + minutes
 		return correctTime
	end
	
end
