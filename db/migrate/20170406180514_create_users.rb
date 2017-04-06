class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :registry
      t.integer :cpf
      t.string :name
      t.string :address
      t.string :phone
      t.string :gender
      t.string :permission
      t.string :birth_date
      t.string :class
      t.string :shift
      t.string :admission_date

      t.timestamps
    end
  end
end
