#File name: parent.rb
#Class name: Parent
#Description:Validates parent's attributes
class Parent < User
  has_many :alumns
  validates :parent_cpf, :cpf => true
end
