# File name: alumn.rb
# Class name: Alumn
# Description: Model used to communicate with the databank
class Alumn < User
  validates :name, presence: true, length: { minimum: 2 }
end
