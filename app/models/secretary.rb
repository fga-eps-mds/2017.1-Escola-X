#File name: secretary.rb
#Class name: Secretary
#Description:Validates secretary's attributes outside single table inheritance
class Secretary < Employee
	def self.search(search)
    where("registry LIKE ? OR name LIKE ?", "#{search}", "%#{search}%")
  end
end
