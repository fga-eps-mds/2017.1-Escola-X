class Grade < ApplicationRecord
	belongs_to :subject 
	belongs_to :alumn
end
