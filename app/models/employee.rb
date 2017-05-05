#File name: parent.rb
#Class name: Parent
#Description:Validates employee's attributes
class Employee < ApplicationRecord
  belongs_to :user, optional: true
  self.inheritance_column = :permission
  validates :employee_cpf, :cpf => true
  has_secure_password
  # validates :registry , presence: true

  before_create{
    generate_token(:authorization_token)
  }
  private
  def generate_token(column)
    begin
      self[column]= SecureRandom.urlsafe_base64
    end while Employee.exists?(column => self[column])
  end
end
