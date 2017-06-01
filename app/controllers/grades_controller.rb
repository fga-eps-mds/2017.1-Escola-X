class GradesController < ApplicationController
  include SessionsHelper

  def self.create (alumn)
    alumn.classroom.subjects.each do |subject|
      if !(Grade.find_by_alumn_id_and_subject_id(alumn.id, subject.id).exists?)
        @grade = Grade.new(alumn_id: alumn.id, subject_id: subject.id,
                      classroom_id: alumn.classroom_id)
        @grade.save
      end
    end
  end

  def set_grades
    @classroom = Classroom.find(params[:id])
    @subject = Subject.find(params[:subject_id])
    @grades = Grade.where(classroom_id:@classroom.id).where(subject_id:@subject.id)
  end

  def self.update_alumn (alumn)
    alumn.grades.each do |grade|
      grade.classroom_id = alumn.classroom_id
      grade.save
    end
    alumn.classroom.subjects.each do |subject|
      if !Grade.find_by_alumn_id_and_subject_id(alumn.id, subject.id).exists?
        GradesController.create(alumn)
      end
    end
  end

  def post_grades
    @classroom = Classroom.find(params[:id])
    @subject = Subject.find(params[:subject_id])
    @alumn = Alumn.find(params[:alumn_id])
    @grade = Grade.find_by_classroom_id_and_subject_id_and_alumn_id(@classroom.id, @subject.id, @alumn.id)
    if @grade.update(grade_params)
      final_grade(@grade,grade_params)
      redirect_to set_grades_path(@classroom, @subject)
    else
      render "grades/index"
    end
  end

  def final_grade (grade,grade_params)
    if (grade_params[:grade_final].blank?)
      grade.grade_final = (grade.grade_01 + grade.grade_02 + grade.grade_03 + grade.grade_04)/4
      grade.save
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
