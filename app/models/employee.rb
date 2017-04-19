#File name: parent.rb
#Class name: Parent
#Description:Validates employee's attributes
class Employee < ApplicationRecord
  belongs_to :user, optional: true
  # validates :employee_cpf, :cpf => true
  validates :registry, presence: true
end
