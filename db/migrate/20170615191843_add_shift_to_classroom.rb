class AddShiftToClassroom < ActiveRecord::Migration[5.0]
  def change
    add_reference :classrooms, :shift, foreign_key: true
  end
end
