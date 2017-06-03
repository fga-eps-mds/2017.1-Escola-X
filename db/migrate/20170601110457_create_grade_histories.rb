class CreateGradeHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :grade_histories do |t|
      t.references :grade, foreign_key: true
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
