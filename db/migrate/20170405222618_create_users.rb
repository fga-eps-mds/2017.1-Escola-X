class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :registry
      t.integer :cpf
      t.string :name
      t.string :address
      t.string :phone
      t.string :gender

      t.timestamps
    end
  end
end
