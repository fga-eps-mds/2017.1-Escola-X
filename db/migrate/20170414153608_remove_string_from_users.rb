class RemoveStringFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :string, :string
  end
end
