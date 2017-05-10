class Suspension < ApplicationRecord
  belongs_to :alumn
  belongs_to :employee

  validates :description, presence: { message: "Não pode estar em branco" },
           length: { minimum: 5,
                     maximum: 300,
                     :too_short => "Deve possuir no mínimo 5 caracteres",
                     :too_long => "Deve possuir no máximo 300 caracteres" }

  validates :quantity_days, presence: { message: "Não pode estar em branco." }

  validates :title, presence: {message: "Este não pode estar em branco"},
  			length: { minimum: 5,
                     maximum: 150,
                     :too_short => "Deve possuir no mínimo 5 caracteres",
                     :too_long => "Deve possuir no máximo 150 caracteres"}
end
