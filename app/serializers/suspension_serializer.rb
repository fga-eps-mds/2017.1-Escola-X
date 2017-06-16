class SuspensionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :date_suspension, :quantity_days
  has_one :alumn
end
