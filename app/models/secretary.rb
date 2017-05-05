#File name: secretary.rb
#Class name: Secretary
#Description:Validates secretary's attributes 

class Secretary < Employee
	belongs_to :employee
	has_secure_password
    before_save :validates_password

  before_create{
    generate_token(:authorization_token)
  }  

  private

  def validates_password
    if self.password_digest.nil?
      validates :password, presence:true,
      length: { minimum: 8}
    end
  end

end