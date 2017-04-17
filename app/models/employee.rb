class Employee < ApplicationRecord
  belongs_to :user, optional: true
  validates :parent_cpf, :cpf => true
end
