class User < ApplicationRecord
  has_one :alumn
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
end
