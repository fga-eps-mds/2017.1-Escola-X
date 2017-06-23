class ClassroomGrade < ApplicationRecord
    has_many :classrooms
    has_many :subjects
    accepts_nested_attributes_for :classrooms
end
