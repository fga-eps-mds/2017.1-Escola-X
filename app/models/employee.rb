#File name: employee.rb
#Class name: Employee
#Description:Validates employee's attributes
class Employee < ApplicationRecord

  has_many :strike

  validates :registry, presence: true

  before_save :validates_password
  self.inheritance_column = :permission
  validates :employee_cpf, :cpf => true
  has_secure_password
  has_many :suspension
  # validates :registry , presence: true

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
