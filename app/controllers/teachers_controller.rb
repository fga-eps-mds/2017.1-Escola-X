# File name: teachers_controller.rb
# Class name: TeachersController
# Description: Controller used to communicate with the view highways/show

class TeachersController < UsersController
  include SessionsHelper

	def index
		if ( logged_in? )
      @teachers = Teacher.all
    end
	end
	
	def new
		if ( is_principal? )
			@user = User.new
		end
	end

	def show
    if ( logged_in? )
      @teachers = Teacher.find(params[:id])
      @user = User.find_by_id(@parent.user_id)
    end
  end

  def edit
    if ( is_principal? )
      @teachers = Teacher.find(params[:id])
      @user = User.find_by_id(@parent.user_id)
    end
  end

  def destroy
    if ( is_principal? )
      @teachers = Teacher.find(params[:id])
      @user = User.find (@parent.user_id)
      @user.destroy
      redirect_to users_path
    end
  end

private
  def parent_params
    params.require(:teacher).permit(:registry)
  end

end
