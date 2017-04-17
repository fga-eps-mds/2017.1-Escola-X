#File name: parent.rb
#Class name: Parent
#Description:Validates parent's attributes
class Parent < ApplicationRecord
  belongs_to :user, optional: true
  validates :parent_cpf, :cpf => true
end
