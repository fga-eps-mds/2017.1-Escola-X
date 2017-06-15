class CreateShifts < ActiveRecord::Migration[5.0]
  def change
    create_table :shifts do |t|
      t.string :name_shift

      t.timestamps
    end
  end
end
