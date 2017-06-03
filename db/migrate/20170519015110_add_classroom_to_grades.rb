class AddClassroomToGrades < ActiveRecord::Migration[5.0]
  def change
    add_reference :grades, :classroom, foreign_key: true
  end
end
