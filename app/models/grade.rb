class Grade < ApplicationRecord
	belongs_to :subject 
	belongs_to :alumn
	belongs_to :classroom
end
