class CreateAlumns < ActiveRecord::Migration[5.0]
  def change
    create_table :alumns do |t|
      t.integer :registry_alumn
      t.string :name_alumn
      t.string :class_alumn
      t.string :shift_alumn
      t.string :address_alumn
      t.string :phone_alumn
      t.string :birth_date_alumn
      t.string :gender_alumn

      t.timestamps
    end
  end
end
