class Classroom < ApplicationRecord
  has_many :alumn

  accepts_nested_attributes_for :alumn

  validates :name_classroom, presence: { message: "não pode estar em branco" },
           length: { minimum: 2,
                     maximum: 5,
                     :too_short => "deve possuir no mínimo 2 caracteres",
                     :too_long => "deve possuir no máximo 5 caracteres" }

  validates :shift_classroom, presence: { message: "não pode estar em branco" },
           length: { minimum: 7,
                     maximum: 11,
                     :too_short => "deve possuir no mínimo 7 caracteres",
                     :too_long => "deve possuir no máximo 11 caracteres" }



end