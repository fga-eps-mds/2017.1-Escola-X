class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.string :title
      t.string :notification_type
      t.text :notification_text
      t.references :employee, foreign_key: true
      t.date :notification_date
      t.time :notification_hour

      t.timestamps
    end
  end
end
