#File name: teacher.rb
#Class name:Teacher
#Description:Validates teacher attributes
class Principal < User
  validates :cpf, presence: true, length:{maximum: 11},
                  uniqueness:true
end
