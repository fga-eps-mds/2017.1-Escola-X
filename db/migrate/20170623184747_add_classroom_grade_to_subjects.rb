class AddClassroomGradeToSubjects < ActiveRecord::Migration[5.0]
  def change
    add_reference :subjects, :classroom_grade, foreign_key: true
  end
end
