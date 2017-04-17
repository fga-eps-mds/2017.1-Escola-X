class Employee < ApplicationRecord
  belongs_to :user, optional: true
  validates :parent_cpf, :cpf => true
  validates :registry, presence: true
end
