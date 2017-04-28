class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :gender
      t.string :birth_date
      t.string :permission

      t.string :parent_cpf

      t.integer :registry
      t.string :shift
      t.references :parent, index: true

      t.timestamps
    end
  end
end
