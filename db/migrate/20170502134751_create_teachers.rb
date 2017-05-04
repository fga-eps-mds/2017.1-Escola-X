class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.string :cpf_teacher
      t.string :admission_date_teacher
      t.string :registry
      t.string :password_teacher

      t.timestamps
    end
  end
end
