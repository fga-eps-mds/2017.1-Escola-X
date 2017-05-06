class AddColumnToNotifications < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :notification_receiver, :integer
  end
end
