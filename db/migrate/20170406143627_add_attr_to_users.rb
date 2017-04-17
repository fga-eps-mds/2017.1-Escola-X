class AddAttrToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :birth_date, :string
    add_column :users, :class, :string
    add_column :users, :shift, :string
    add_column :users, :admission_date, :string
  end
end
