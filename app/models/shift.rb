class Shift < ApplicationRecord
    has_many :classrooms
    accepts_nested_attributes_for :classrooms
end
