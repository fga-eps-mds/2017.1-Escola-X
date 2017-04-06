class ChangeCpfOfUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :cpf, :string
  end
end
