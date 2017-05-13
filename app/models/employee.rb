#File name: employee.rb
#Class name: Employee
#Description:Validates employee's attributes
class Employee < ApplicationRecord
  before_save :validates_password
  has_many :strike
  has_many :suspension

  self.inheritance_column = :permission
  has_secure_password

  validates :registry, presence: { message: "não pode estar em branco" },
                       uniqueness: true

  validates :employee_cpf, :cpf => true

  validates :shift, presence: { message: "não pode estar em branco" },
            length: { minimum: 6,
                      maximum: 11,
                      :too_short => "deve possuir no mínimo 6 caracteres",
                      :too_long => "deve possuir no máximo 11 caracteres" }

  validates :birth_date, presence: { message: "não pode estar em branco." }

  #Precisa ser arrumada nos forms de Secretary e Teacher
  # validates :admission_date, presence: { message: "não pode estar em branco." }

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

  def generate_token(column)
    begin
      self[column]= SecureRandom.urlsafe_base64
    end while Employee.exists?(column => self[column])
  end

end
