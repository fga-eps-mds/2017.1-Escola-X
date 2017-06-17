class ReaderController < ApplicationController
	include SessionsHelper
	include ReaderHelper
	
	def index
		if ( logged_in? and is_principal? )
			bar_code = params[:bar_code]

			date = mountCurrentDate()	

			@alumn = nil
			@alumn = Alumn.find_by_bar_code bar_code

			give_presence_to_alumn(date , @alumn)
		else
      		redirect_to "/errors/error_500"
    	end
	end

	private 
	def give_presence_to_alumn(date , alumn)
		
		school_misses = nil
		if (alumn != nil)
			school_misses = alumn.school_misses.all
		else
			# nothing to do in here
		end
		
		if (school_misses != nil)
			for school_miss in school_misses
			
				if (school_miss.date.to_s == date.to_s)
					school_miss.destroy
				else
					# nothing to do in here
				end	
			end

		end
	end
	
	TWO_POINTS = ":"
	DATE_SPACE = "/"
	SPACE_TRACE_SPACE = "-"
	ADJUSTING_FUSE_TO_BRAZILIAN = 3;
	ZERO = "0";
	SINGLE_CHAR = 1


	def mountCurrentDate() 
	
 		#hour = (Time.current.hour - ADJUSTING_FUSE_TO_BRAZILIAN).to_s
 		#minute = Time.current.min .to_s
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
end
