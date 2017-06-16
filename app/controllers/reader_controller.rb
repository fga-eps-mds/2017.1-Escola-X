class ReaderController < ApplicationController
	include SessionsHelper
	
	def index
		if ( logged_in? and is_principal? )
			bar_code = params[:bar_code]

			time = mountCurrentTime()	
			# do method to get date	

			@alumn = Alumn.find_by_bar_code bar_code
		else
      		redirect_to "/errors/error_500"
    	end
	end
	
	TWO_POINTS = ":"
	DATE_SPACE = "/"
	SPACE_TRACE_SPACE = " - "
	ADJUSTING_FUSE_TO_BRAZILIAN = 3;

	private 
	def mountCurrentTime() 
	
 		hour = (Time.current.hour - ADJUSTING_FUSE_TO_BRAZILIAN).to_s
 		minute = Time.current.min .to_s
 		day = Time.current.day.to_s
 		month = Time.current.month.to_s
 		year = Time.current.year.to_s

 		correctDate = day + DATE_SPACE + month + DATE_SPACE + year + SPACE_TRACE_SPACE + 
 						+ hour + TWO_POINTS + minute
		return correctDate.to_s
	end
end
