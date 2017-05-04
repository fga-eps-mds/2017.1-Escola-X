class Teacher < ApplicationRecord
	belongs_to :user, optional: true
  	validates :cpf_teacher, :cpf => true
end
