class Subject < ApplicationRecord
	belongs_to :teacher
	has_many :grades
	validates_associated :grades
	has_many :alumns, through: :grades
	validates_associated :alumns

/\A[+-]?\d+\z/

  validates :name_subject, 
  			presence: { message: "Não pode estar em branco!" },
  			length: { minimum: 5,
		            maximum: 20,
		            :too_short => "deve possuir mais de 5 caracteres.",
		            :too_long => "deve possuir no máximo 20 caracteres."}

  validates :class_level,
            presence: {message: "A série não pode estar em branco!"},
            numericality: { only_integer: true }

  validates :teacher,
            presence: { message: "Usuário não válido para criar notificação!" },
            uniqueness: true
            #uni {case_sensitive: false}



end

Subject.create(name_subject: "portugues").valid?
