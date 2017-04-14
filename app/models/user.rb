class User < ApplicationRecord
  has_one :parent

  accepts_nested_attributes_for :parent
end
