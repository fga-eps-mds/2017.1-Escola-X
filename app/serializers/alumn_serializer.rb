class AlumnSerializer < ActiveModel::Serializer
  attributes :id, :registry, :name
  has_one :parent
end
