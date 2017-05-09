class CreateClassrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :classrooms do |t|
      t.string :name_classroom
      t.string :shift_classroom

      t.timestamps
    end
  end
end
