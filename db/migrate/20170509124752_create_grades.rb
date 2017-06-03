class CreateGrades < ActiveRecord::Migration[5.0]
  def change
    create_table :grades do |t|
      t.float :grade_01, default: 0
      t.float :grade_02, default: 0
      t.float :grade_03, default: 0
      t.float :grade_04, default: 0
      t.float :grade_final, default: 0
      t.references :alumn
      t.references :subject

      t.timestamps
    end
  end
end
