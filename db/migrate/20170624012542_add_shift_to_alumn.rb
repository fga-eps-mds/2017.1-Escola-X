class AddShiftToAlumn < ActiveRecord::Migration[5.0]
  def change
    add_reference :alumns, :shift, foreign_key: true
  end
end
