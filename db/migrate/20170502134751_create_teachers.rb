class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.string :cpfTeacher
      t.date :admissionDateTeacher
      t.integer :registerTeacher
      t.string :loginTeacher
      t.string :passowordTeacher

      t.timestamps
    end
  end
end
