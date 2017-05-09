class Subject < ApplicationRecord
	belongs_to :teacher
	has_many :grades
	has_many :alumns, through: :grades
end
