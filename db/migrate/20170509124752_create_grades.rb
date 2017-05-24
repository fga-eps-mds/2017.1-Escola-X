class CreateGrades < ActiveRecord::Migration[5.0]
  def change
    create_table :grades do |t|
      t.float :grade_01
      t.float :grade_02
      t.float :grade_03
      t.float :grade_04
      t.float :grade_final
      t.references :alumn
      t.references :subject

      t.timestamps
    end
  end
end
