class AddAuthTokenToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :authorization_token, :string
  end
end
