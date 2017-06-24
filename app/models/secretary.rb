#File name: secretary.rb
#Class name: Secretary
#Description:Validates secretary's attributes outside single table inheritance
class Secretary < Employee
	before_save :set_password
end
