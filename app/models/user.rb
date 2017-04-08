#File name:user.rb
#Class name: User
#Description: Validates the requeriments made by the controller and saves in the
#            data base
class User < ApplicationRecord
  self.inheritance_column = :permission
  has_secure_password
  validates :password, presence:true #length{}

  before_create{
    generate_token(:authorization_token)
  }

  private
  def generate_token(column)
    begin
      self[column]= SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
