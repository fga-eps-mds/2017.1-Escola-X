class DropAlumns < ActiveRecord::Migration[5.0]
  def change
    drop_table :alumns
  end
end
