class ChangeTypeToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :type, :permission
  end
end
