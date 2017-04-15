class AddBirthDateToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :birth_date, :string
  end
end
