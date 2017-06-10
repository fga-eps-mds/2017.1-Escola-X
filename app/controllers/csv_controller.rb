class CsvController < ApplicationController


	def index
	  @report = Product.order(:subject)
	  respond_to do |format|
	    format.html
	    format.csv { send_data @report.to_csv }
	  end
	end


end
