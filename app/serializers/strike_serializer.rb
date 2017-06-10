class StrikeSerializer < ActiveModel::Serializer
  attributes :id,:description_strike, :date_strike
  has_one :alumn
end
