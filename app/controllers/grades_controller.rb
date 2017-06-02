class GradesController < ApplicationController
  include SessionsHelper

  def self.create (alumn)
    alumn.classroom.subjects.each do |subject|
      if !(Grade.where(alumn_id:alumn.id).where(subject_id: subject.id).exists?)
        @grade = Grade.new(alumn_id: alumn.id, subject_id: subject.id,
                      classroom_id: alumn.classroom_id)
        @grade.save
      end
    end
  end

  def set_grades
    if (is_secretary? or is_principal?)
      @classroom = Classroom.find(params[:id])
      @subject = Subject.find(params[:subject_id])
      @grades = Grade.where(classroom_id:@classroom.id).where(subject_id:@subject.id)
    end
  end

  def self.update_alumn (alumn)
    alumn.grades.each do |grade|
      grade.classroom_id = alumn.classroom_id
      grade.save
    end
    alumn.classroom.subjects.each do |subject|
      if !Grade.where(alumn_id:alumn.id).where(subject_id: subject.id).exists?
        GradesController.create(alumn)
      end
    end
  end

  def post_grades
    if is_secretary?
      @classroom = Classroom.find(params[:id])
      @subject = Subject.find(params[:subject_id])
      @alumn = Alumn.find(params[:alumn_id])
      @grade = Grade.find_by_classroom_id_and_subject_id_and_alumn_id(@classroom.id, @subject.id, @alumn.id)
      if @grade.update(grade_params)
        GradeHistoriesController.create(@grade,@current_user)
        redirect_to set_grades_path(@classroom, @subject)
      else
        render "grades/index"
      end
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
