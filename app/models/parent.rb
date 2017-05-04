#File name: parent.rb
#Class name: Parent
#Description:Validates parent's attributes
class Parent < ApplicationRecord
  has_many :alumns
  validates :parent_cpf, :cpf => true
end
