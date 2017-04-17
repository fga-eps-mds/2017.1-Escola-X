class AddPermissionToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :permission, :string
  end
end
