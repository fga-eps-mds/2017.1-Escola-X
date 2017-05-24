class GradesController < ApplicationController
  include SessionsHelper

  def index
    if (is_secretary?)
    	@classrooms = Classroom.all
    end
  end

  def new
    if (is_secretary?)
      @grade = Grade.new
    end
  end

  def show
    if (is_secretary?)
      @grade = Grade.find(params[:id])
    end
  end

  def self.create (alumn)
      alumn.classroom.subjects.each do |subject|
        if !(Grade.where(alumn_id: alumn.id).where(subject_id: subject.id).exists?)
          Grade.create!(alumn_id: alumn.id, subject_id: subject.id,
                        classroom_id: alumn.classroom_id)
        end
      end
  end

  def destroy
  if (is_secretary?)
    @grade = grade.find(params[:id])
    @grade.destroy
    redirect_to users_path
  end
end

def edit
  if ( is_secretary? )
    @grade = grade.find(params[:id])
  end
end

def set_grades
  @classroom = Classroom.find(params[:id])
  @subject = Subject.find(params[:subject_id])
  @grades = Grade.where(classroom_id: @classroom.id).where(subject_id: @subject.id)
end

def self.update_alumn (alumn)
  alumn.grades.each do |grade|
      grade.classroom_id = alumn.classroom_id
      grade.save
  end
end

def post_grades
  @classroom = Classroom.find(params[:id])
  @subject = Subject.find(params[:subject_id])
  @alumn = Alumn.find(params[:alumn_id])
  @grade = Grade.where(classroom_id: @classroom.id).where(subject_id: @subject.id).where(alumn_id: @alumn.id)
  if @grade.update(grade_params)
    redirect_to set_grades_path(@classroom, @subject)
  else
    render "grades/index"
  end
end

private
  def grade_params
    params.require(:grade).permit(:grade_01,
                                  :grade_02,
                                  :grade_03,
                                  :grade_04,
                                  :grade_final,
                                  :alumn_id,
                                  :subject_id)
  end
end
