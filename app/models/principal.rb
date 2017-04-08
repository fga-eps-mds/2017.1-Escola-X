#File name: principal.rb
#Class name:Principal
#Description:Validates principal's attributes
class Principal < User
  validates :cpf, presence: true,
                  uniqueness:true
end
