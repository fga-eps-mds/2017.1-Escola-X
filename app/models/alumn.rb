#File name: alumn.rb
#Class name:Alumn
#Description:Validates alumn attributes
class Alumn < User
  validates :registry, presence:true,#,length{to define}
                       uniqueness: true

end
