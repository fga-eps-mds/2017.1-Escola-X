class CreateClassroomSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :classroom_subjects do |t|
      t.references :classroom, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
