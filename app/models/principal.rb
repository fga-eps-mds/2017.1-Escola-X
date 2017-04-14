#File name: principal.rb
#Class name:Principal
#Description:Validates principal's attributes
class Principal < ApplicationRecord
  validates :cpf, presence: true,
                  uniqueness:true
end
