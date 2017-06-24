class StrikeSerializer < ActiveModel::Serializer
  attributes :id,:description_strike, :date_strike, :created_at
  has_one :alumn
end
