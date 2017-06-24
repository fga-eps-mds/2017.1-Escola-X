class ClassroomGrade < ApplicationRecord
    has_many :classrooms
    accepts_nested_attributes_for :classrooms
end
