class AlumnSerializer < ActiveModel::Serializer
  attributes :id,:name, :registry, :created_at
  has_one :parent
end
