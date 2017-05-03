class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.string :cpfTeacher
      t.string :admission_date_teacher
      t.integer :register_teacher
      t.string :registry
      t.string :passoword_teacher

      t.timestamps
    end
  end
end
