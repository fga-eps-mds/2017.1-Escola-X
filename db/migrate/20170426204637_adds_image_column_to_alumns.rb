class AddsImageColumnToAlumns < ActiveRecord::Migration[5.0]
  def change
    add_column :alumns, :image, :string
  end
end
