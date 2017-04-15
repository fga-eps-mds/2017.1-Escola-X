class User < ApplicationRecord
  has_one :parent, autosave: true ,dependent: :destroy

  accepts_nested_attributes_for :parent
end
