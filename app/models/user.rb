class User < ApplicationRecord
  has_one :parent, autosave: true

  accepts_nested_attributes_for :parent
end
