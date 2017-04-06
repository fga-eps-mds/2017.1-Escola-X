#File name: alumn.rb
#Class name:Alumn
#Description:Validates parent attributes
class Parent < User
  validates :cpf, presence: true, length:{maximum: 11},
                  uniqueness:true
end
