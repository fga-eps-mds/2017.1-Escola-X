class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :title, :notification_type, :notification_text, :notification_date, :motive, :created_at
end
