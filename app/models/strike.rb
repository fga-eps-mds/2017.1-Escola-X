#File name: strike.rb
#Class name: Strike
#Description: Validates strike's attributes
class Strike < ApplicationRecord
  belongs_to :alumn
  belongs_to :employee

  validates :description_strike, presence: { message: "não pode estar em branco" },
           length: { minimum: 5,
                     maximum: 300,
                     :too_short => "deve possuir no mínimo 5 caracteres",
                     :too_long => "deve possuir no máximo 300 caracteres" }

  validates :date_strike, presence: { message: "Não pode estar em branco." }
end
