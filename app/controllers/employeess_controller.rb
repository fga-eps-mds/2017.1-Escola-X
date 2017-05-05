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

  def show
    if ( logged_in? )
      @teacher = Teacher.find(params[:id])
    end
  end

  def new
    if ( is_principal? )
      @teacher = Teacher.new
    end
  end

  def edit
    if ( is_principal? )
      @teacher = Teacher.find(params[:id])
    end
  end

  def create
    if ( is_principal? )
      @teacher = Teacher.new(teacher_params)

      if (@teacher.save)
        redirect_to users_path
      end
    end
  end

  def update
    if ( is_principal? )
      @teacher = Teacher.find(params[:id])
      if ( @teacher.update(teacher_params) )
        redirect_to @teacher
      else
        render 'edit'
      end
    end
  end

  def destroy
    if ( is_principal? )
      @teacher = Teacher.find(params[:id])
      @teacher.destroy

      redirect_to users_path
    end
  end

private
  def teacher_params
    params.require(:teacher).permit(:cpf_teacher,
                                   :admission_date_teacher,
                                   :registry,
                                   :password_teacher)
  end
end
