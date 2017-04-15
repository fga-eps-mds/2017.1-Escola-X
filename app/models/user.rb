class User < ApplicationRecord
  has_one :alumn, autosave: true,dependent: :destroy
  accepts_nested_attributes_for :alumn

  validates :name, presence: { message: "não pode estar em branco" },
                   length: { minimum: 5,
                             maximum: 64,
                             :too_short => "deve possuir no mínimo 5 caracteres",
                             :too_long => "deve possuir no máximo 64 caracteres" }
  validates :address, presence: { message: "não pode estar em branco" },
                   length: { minimum: 5,
                             maximum: 64,
                             :too_short => "deve possuir no mínimo 5 caracteres",
                             :too_long => "deve possuir no máximo 64 caracteres" }
  validates :phone, length: { in: 10..11,
                              :too_short => "deve possuir no mínimo 10 dígitos",
                              :too_long => "deve possuir no máximo 11 dígitos" }
end
