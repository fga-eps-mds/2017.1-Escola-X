class AlumnSerializer < ActiveModel::Serializer
  attributes :id,:name, :registry
  has_one :parent
end
