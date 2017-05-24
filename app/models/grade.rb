class Grade < ApplicationRecord
	belongs_to :subject
	belongs_to :alumn, dependent: :destroy
	belongs_to :classroom
end
