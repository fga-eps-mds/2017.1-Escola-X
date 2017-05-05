#File name: secretary.rb
#Class name: Secretary
#Description:Validates secretary's attributes 

class Secretary < Employee
	belongs_to :employee
  validates :parent_cpf, :cpf => true
	has_secure_password
    before_save :validates_password

  validates :shift, presence: { message: "não pode estar em branco" },
            length: { minimum: 7,
                      maximum: 11,
                      :too_short => "deve possuir no mínimo 7 caracteres",
                      :too_long => "deve possuir no máximo 11 caracteres" }


  validates :birth_date, presence: { message: "não pode estar em branco." }

  validates :admision_date, presence: { message: "não pode estar em branco." }

  validates :gender, presence: { message: "Não pode estar em branco." }

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

  before_create{
    generate_token(:authorization_token)
  }  

  private

  def validates_password
    if self.password_digest.nil?
      validates :password, presence:true,
      length: { minimum: 8}
    end
  end

end