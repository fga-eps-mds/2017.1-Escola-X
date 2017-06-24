class SuspensionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :date_suspension, :quantity_days, :created_at
  has_one :alumn
end
