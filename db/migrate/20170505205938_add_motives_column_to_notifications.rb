class AddMotivesColumnToNotifications < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :motive, :string
  end
end
