#File name: alumn.rb
#Class name: Alumn
#Description: Validates alumn's attributes
class Alumn < ApplicationRecord
  validates :registry, presence:true,#,length{to define}
                       uniqueness: true

end
