# File name: alumns_controller.rb
# Class name: AlumnsController
# Description: Controller used to communicate with the proprietary view of alumns
class TeachersController < ApplicationController
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
        flash[:notice] = "Professor(a) criado(a) com sucesso"
        redirect_to users_path
      else
        render 'new'
      end
    end
  end

  def update
    if ( is_principal? )
      @teacher = Teacher.find(params[:id])
      if ( @teacher.update(teacher_params) )
        flash[:notice] = "Professor(a) alterado(a) com sucesso"
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
    params.require(:teacher).permit(:registry,
                                   :admission_date,
                                   :employee_cpf,
                                   :shift,
																	 :password,
                                   :name,
                                   :address,
                                   :phone,
                                   :gender,
                                   :birth_date,
                                   :admission_date)
  end
end
