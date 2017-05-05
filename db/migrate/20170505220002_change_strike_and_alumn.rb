class ChangeStrikeAndAlumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :strikes, :quantity_strike
    add_column :alumns, :quantity_strike, :integer
  end
end
