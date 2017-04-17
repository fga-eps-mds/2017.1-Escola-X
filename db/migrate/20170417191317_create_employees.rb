class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.integer :registry
      t.string :cpf
      t.string :admission_date
      t.string :shift
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
