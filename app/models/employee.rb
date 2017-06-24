#File name: employee.rb
#Class name: Employee
#Description:Validates employee's attributes
class Employee < ApplicationRecord

  has_many :strike
  has_many :suspension
  has_many :grade_histories

  has_secure_password validations: false


  self.inheritance_column = :permission

  validates :registry, presence: { message: "não pode estar em branco" },
                       uniqueness: true

  validates :employee_cpf, :cpf => true

  validates :shift, presence: { message: "não pode estar em branco" },
            length: { minimum: 6,
                      maximum: 11,
                      :too_short => "deve possuir no mínimo 6 caracteres",
                      :too_long => "deve possuir no máximo 11 caracteres" }

  validates :gender, presence: { message: "Não pode estar em branco." }

  validates :name, presence: { message: "não pode estar em branco" },
            length: { minimum: 5,
                      maximum: 64,
                      :too_short => "deve possuir no mínimo 5 caracteres",
                      :too_long => "deve possuir no máximo 64 caracteres" }

  validates :address,
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

  def generate_token(column)
    begin
      self[column]= SecureRandom.urlsafe_base64
    end while Employee.exists?(column => self[column])
  end

  def set_password
    self.password = self.employee_cpf
  end
    
  def self.search(search)
    where("registry LIKE ? OR name LIKE ?", "#{search}", "%#{search}%")
  end
end
