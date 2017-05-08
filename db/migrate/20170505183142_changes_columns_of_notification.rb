class ChangesColumnsOfNotification < ActiveRecord::Migration[5.0]
  def change
    remove_column :notifications, :notification_type
    remove_column :notifications, :notification_receiver
    remove_column :notifications, :index_notifications_on_notification_emitter_id
  end
end
