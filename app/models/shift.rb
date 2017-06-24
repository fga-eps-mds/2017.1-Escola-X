class Shift < ApplicationRecord
    has_many :classrooms
    has_many :employees
    has_many :alumns
    accepts_nested_attributes_for :classrooms
end
