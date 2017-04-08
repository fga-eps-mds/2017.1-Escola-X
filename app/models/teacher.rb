#File name: teacher.rb
#Class name:Teacher
#Description:Validates teacher's attributes
class Teacher < User
  validates :registry, presence: true,#length{to define}
                       uniqueness: true
  validates :admission_date, presence: true
  validates :cpf, presence: true, length:{maximum: 11},
                                  uniqueness:true

end
