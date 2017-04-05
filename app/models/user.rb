#File name:user.rb
#Class name: User
#Description: Validates the requeriments made by controller and saves in the data bank
class User < ApplicationRecord
  has_secure_password
  validates :password, presence:true #length{}
end
