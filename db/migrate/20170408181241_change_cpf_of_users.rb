class ChangeCpfOfUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :cpf, :integer, limit:8
  end
end
