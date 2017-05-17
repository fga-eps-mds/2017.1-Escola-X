class AddClassroomToSubject < ActiveRecord::Migration[5.0]
  def change
    add_reference :subjects, :classroom, foreign_key: true
  end
end
