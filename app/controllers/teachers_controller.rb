# File name: teachers_controller.rb
# Class name: TeachersController
# Description: Controller used to communicate with the view highways/show

class TeachersController < UsersController
  # include SessionsHelper

	def index
		if ( logged_in? )
      @teachers = User.all.where(:permission => "Teacher")

    end
	end

	def new
		if ( is_principal? )
			@user = User.new
		end
	end

	def show
    if ( logged_in? )
      @teacher = Teacher.find(params[:id])
      @user = User.find_by_id(@teacher.user_id)
    end
  end

  def edit
    if ( is_principal? )
      @teacher = Teacher.find(params[:id])
      @user = User.find_by_id(@teacher.user_id)
    end
  end

  def destroy
    if ( is_principal? )
      @teacher = Teacher.find(params[:id])
      @user = User.find (@teacher.user_id)
      @user.destroy
      redirect_to users_path
    end
  end
end
