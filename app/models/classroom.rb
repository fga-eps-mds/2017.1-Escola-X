class Classroom < ApplicationRecord
  has_many :alumn

  accepts_nested_attributes_for :alumn
end
