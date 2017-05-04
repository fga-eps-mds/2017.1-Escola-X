class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.integer :registry
      t.string :employee_cpf
      t.string :admission_date
      t.string :shift

      t.string :name
      t.string :address
      t.string :phone
      t.string :gender
      t.string :birth_date
      t.string :permission
      t.string :password_digest
      t.string :authorization_token

      t.timestamps
    end
  end
end
