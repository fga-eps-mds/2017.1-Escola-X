class CreateAlumns < ActiveRecord::Migration[5.0]
  def change
    create_table :alumns do |t|
      t.integer :registy
      t.string :shift
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
