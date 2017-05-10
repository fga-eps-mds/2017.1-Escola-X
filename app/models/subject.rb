class Subject < ApplicationRecord
	belongs_to :teacher
	has_many :grades
	has_many :alumns, through: :grades

	validates :name_subject, presence:{message:"A matéria precisa ter um nome."},
	 												 length:{minimum: 4,
													 				 maximum: 80,
																 	 too_short: "Mínimo de 4 caracteres.",
																 	 too_long: "Máximo de 80 caracteres."}

	validates :class_level, presence:{message:"Deve existir uma série"},
													length:{minimum: 1,
																	maximum: 30,
																	too_short: "Mínimo de 1 caracteres.",
																	too_long: "Máximo de 30 caracteres."}
end
