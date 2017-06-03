class GradeHistory < ApplicationRecord
  belongs_to :grade
  belongs_to :employee
end
