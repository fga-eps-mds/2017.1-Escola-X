class AddClassroomGradeToClassroom < ActiveRecord::Migration[5.0]
  def change
    add_reference :classrooms, :classroom_grade, foreign_key: true
  end
end
