#File name: teacher.rb
#Class name: Teacher
#Description: Validates teacher's attributes outside single table inheritance
class Teacher < Employee
  has_many :subjects
  before_save :set_password
end
