class AddPhotoToAlumn < ActiveRecord::Migration[5.0]
  def change
    add_column :alumns, :photo, :bytea
  end
end
