#File name: classroom.rb
#Class name: Classroom
#Description: Validates classroom's attributes
class Classroom < ApplicationRecord
  has_many :alumns
  has_many :classroom_subjects, dependent: :destroy
  has_many :grades
  has_many :subjects, through: :classroom_subjects
  belongs_to :classroom_grades
  belongs_to :shifts
  accepts_nested_attributes_for :alumns

  validates :name_classroom, presence: { message: "não pode estar em branco" },
           length: { minimum: 1,
                     maximum: 5,
                     :too_short => "deve possuir no mínimo 1 caracter",
                     :too_long => "deve possuir no máximo 5 caracteres" }

end
