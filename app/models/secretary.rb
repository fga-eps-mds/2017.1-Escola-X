#File name: secretary.rb
#Class name: Secretary
#Description:Validates secretary's attributes 

class Secretary < Employee
    before_save :validates_password

  validates :shift, presence: { message: "não pode estar em branco." },
            length: { minimum: 7,
                      maximum: 11,
                      :too_short => "deve possuir no mínimo 7 caracteres.",
                      :too_long => "deve possuir no máximo 11 caracteres." }


  validates :birth_date, presence: { message: "não pode estar em branco." }

  validates :admission_date, presence: { message: "não pode estar em branco." }

  validates :registry, presence: {message: "não pode estar em branco."},
                        uniqueness: true,
                       length: { in: 5..6,
                                      :too_short => "deve possuir no mínimo 5 dígitos.",
                                      :too_long => "deve possuir no máximo 6 dígitos."}

  validates :gender, presence: { message: "Não pode estar em branco." }

  validates :name, presence: { message: "não pode estar em branco." },
            length: { minimum: 5,
                      maximum: 64,
                      :too_short => "deve possuir no mínimo 5 caracteres.",
                      :too_long => "deve possuir no máximo 64 caracteres." }

  validates :address, presence: { message: "não pode estar em branco." },
            length: { minimum: 5,
                      maximum: 64,
                      :too_short => "deve possuir no mínimo 5 caracteres.",
                      :too_long => "deve possuir no máximo 64 caracteres." }

  validates :phone, length: { in: 10..11,
                              :too_short => "deve possuir no mínimo 10 dígitos.",
                              :too_long => "deve possuir no máximo 11 dígitos." }


 def self.search(search)
  where("name LIKE ?", "%#{search}%")
end

end