class ChangesTypeOfUsersBirthdate < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :birth_date, :date
  end
end
