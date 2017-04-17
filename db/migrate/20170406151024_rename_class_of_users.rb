class RenameClassOfUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users,:class, :classroom
  end
end
