# File name: teachers_controller.rb
# Class name: TeachersController
# Description: Controller used to communicate with the view highways/show

class TeachersController < UsersController
  include SessionsHelper
	def index

	end
	def new
		if ( is_principal? )
			@user = User.new
		end
	end
end
