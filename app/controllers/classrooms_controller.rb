# File name: classrooms_controller.rb
# Class name: ClassroomsController
# Description: Controller used to communicate with the proprietary view of classrooms
class ClassroomsController < ApplicationController
  include SessionsHelper

  def index
    if ( is_principal? or is_secretary? )
      @classrooms = Classroom.all.order('name_classroom')
      unless params[:classroom_grade_id].blank?
        @classrooms &= Classroom.where(classroom_grade_id: params[:classroom_grade_id])
      end
      unless params[:shift_id].blank?
        @classrooms &= Classroom.where(shift_id: params[:shift_id])
      end
      if (@classrooms.empty?)
        flash.now[:notice] = "Nenhuma Turma encontrada!"
      end
    else
      redirect_to "/errors/error_500"
    end
  end

  def new
    if ( is_principal? )
      @classroom = Classroom.new
      @classroom_grades = ClassroomGrade.all
      @shifts = Shift.all
    else
      redirect_to "/errors/error_500"
    end
  end

  def show
    if ( is_principal? or is_secretary?)
      @classroom = Classroom.find(params[:id])
      @shift = Shift.find_by_id(@classroom.shift_id)
      @classroom_grade = ClassroomGrade.find_by_id(@classroom.classroom_grade_id)
    else
      redirect_to "/errors/error_500"
    end
  end

  def create
    if ( is_principal? )
      @classroom = Classroom.create(classroom_params)
      @classroom_grades = ClassroomGrade.all
      @shifts = Shift.all
      if ( @classroom.save )
        flash[:success] = "Turma criada com sucesso"
        redirect_to classroom_path(@classroom)
      else
        render 'classrooms/new'
      end
    else
      redirect_to "/errors/error_500"
    end
  end

  def destroy
  if ( is_principal? )
    @classroom = Classroom.find(params[:id])
    @classroom.destroy
    flash[:alert] = "Turma excluída com sucesso"
    redirect_to users_path
  else
      redirect_to "/errors/error_500"
  end
end

def edit
  if ( is_principal? )
    @classroom = Classroom.find(params[:id])
    @classroom_grades = ClassroomGrade.all
    @shifts = Shift.all
  else
      redirect_to "/errors/error_500"
  end
end

def update
  if ( is_principal? )
    @classroom = Classroom.find(params[:id])
    @classroom_grades = ClassroomGrade.all
    @shifts = Shift.all
    if @classroom.update(classroom_params)
      flash[:notice] = "Turma alterada com sucesso"
      redirect_to classroom_path(@classroom)
    else
      render "classrooms/edit"
    end
  else
      redirect_to "/errors/error_500"
  end
end

def add_alumns
  if ( is_principal? )
    @classroom = Classroom.find(params[:id])
    @alumns = @classroom.alumns.order('name')
  else
      redirect_to "/errors/error_500"
  end
end

def add_alumn
  if ( is_principal? )
    @classroom = Classroom.find(params[:id])
    @alumns = @classroom.alumns
    @alumn = Alumn.find_by_registry(params[:registry])
    if ( (@alumn).nil? )
      redirect_to add_alumns_path(@classroom)
    else
      @alumn.classroom_id = @classroom.id
      if @alumn.save
        GradesController.update_alumn(@alumn)
        render "classrooms/add_alumns"
      else
        render "classrooms/add_alumns"
      end
    end
  else
      redirect_to "/errors/error_500"
  end
end

private
  def classroom_params
    params.require(:classroom).permit(:name_classroom,
                                      :shift_id,
                                      :classroom_grade_id)
  end
end
