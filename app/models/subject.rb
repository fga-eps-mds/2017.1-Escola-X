class Subject < ApplicationRecord
	has_many :grades
	has_many :alumns, through: :grades
end
