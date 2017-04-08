#File name: parent.rb
#Class name: Parent
#Description:Validates parent's attributes
class Parent < User
  validates :cpf, presence: true, length:{maximum: 11},
                  uniqueness:true
end
