class RemoveNameColumnFromAlumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :alumns, :name_alumn, :string
  end
end
