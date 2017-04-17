class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :string
      t.string :address
      t.string :string
      t.string :phone
      t.string :string
      t.string :gender
      t.string :string

      t.timestamps
    end
  end
end
