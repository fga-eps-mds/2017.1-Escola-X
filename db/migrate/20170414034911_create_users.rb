class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :gender
      t.date :birth_date
      t.string :password

      t.timestamps
    end
  end
end
