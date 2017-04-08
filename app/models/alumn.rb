#File name: alumn.rbAlumn
#Class name:Alumn
#Description:Validates alumn's attributes
class Alumn < User
  validates :registry, presence:true,#,length{to define}
                       uniqueness: true

end
