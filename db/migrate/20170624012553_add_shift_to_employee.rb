class AddShiftToEmployee < ActiveRecord::Migration[5.0]
  def change
    add_reference :employees, :shift, foreign_key: true
  end
end
