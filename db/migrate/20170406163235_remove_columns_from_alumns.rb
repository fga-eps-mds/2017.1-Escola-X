class RemoveColumnsFromAlumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :alumns, :address_alumn, :string
    remove_column :alumns, :phone_alumn, :string
    remove_column :alumns, :birth_date_alumn, :string
    remove_column :alumns, :gender_alumn, :string
  end
end
