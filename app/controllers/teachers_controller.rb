require 'set'

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
        flash[:now] = "Professor(a) criado(a) com sucesso"
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
        flash[:now] = "Professor(a) alterado(a) com sucesso"
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

  def teacher_classrooms
    @subjects = Subject.where("teacher_id = ?", params[:id])
    @classrooms = Set.new
    @subjects.each do |subject|
      relations = ClassroomSubject.where("subject_id = ?", subject.id)
      relations.each do |relation|
        @classrooms.add(Classroom.find_by_id(relation.classroom_id))
      end
    end
  end

  def teacher_classroom_subjects
    @subjects = Subject.where("teacher_id = ?", params[:teacher_id])
    current_classroom_id = params[:classroom_id]
    @classroom_subjects = []
    @subjects.each do |subject|
      @classroom_subjects << subject
    end
  end

  def teacher_grades
    @classroom = Classroom.find(params[:classroom_id])
    @subject = Subject.find(params[:subject_id])
    @grades = Grade.where(classroom_id: @classroom.id).where(subject_id: @subject.id)
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
