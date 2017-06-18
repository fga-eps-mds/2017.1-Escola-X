class CreateClassroomGrades < ActiveRecord::Migration[5.0]
  def change
    create_table :classroom_grades do |t|
      t.string :name_classroom_grade

      t.timestamps
    end
  end
end
