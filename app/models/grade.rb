#File name: grade.rb
#Class name: Grade
#Description: Validates alumn's grade attributes
class Grade < ApplicationRecord
	belongs_to :subject
	belongs_to :alumn
end
