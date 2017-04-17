class RemoveAttrFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :admission_date
    remove_column :users, :shift
    remove_column :users, :classroom
    remove_column :users, :registry
  end
end
