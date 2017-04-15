class Alumn < ApplicationRecord
  belongs_to :user , optional: true

  validates :registry, presence: { message: "não pode estar em branco" },
                                           length: { minimum: 5,
                                                     maximum: 6,
                                                     :too_short => "deve possuir no mínimo 5 caracteres",
                                                     :too_long => "deve possuir no máximo 6 caracteres" }

  validates :shift, presence: { message: "não pode estar em branco" },
                                            length: { minimum: 7,
                                                      maximum: 11,
                                                      :too_short => "deve possuir no mínimo 7 caracteres",
                                                      :too_long => "deve possuir no máximo 11 caracteres" }

end
