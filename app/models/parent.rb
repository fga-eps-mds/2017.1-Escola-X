#File name: parent.rb
#Class name: Parent
#Description:Validates parent's attributes
class Parent < ApplicationRecord
  has_many :alumns
  validates :parent_cpf, :cpf => false
  has_secure_password validations: false
  before_save :set_login
  before_save :set_password

  validates :name, presence: { message: "não pode estar em branco" },
            length: { minimum: 5,
                      maximum: 64,
                     :too_short => "deve possuir no mínimo 5 caracteres",
                     :too_long => "deve possuir no máximo 64 caracteres" }

  before_create{
    generate_token(:authorization_token)
  }

  def get_age
    DateTime.now.year - self.birth_date.year
  end

  private
  def set_login
    # if(self.name != nil)
      jao =  self.name.downcase
      names = Array.new
      names = jao.split(' ')
      self.login = names[0]+"."+names[names.length-1]
    # end
  end

  def set_password
    if(self.name != nil)
      name = self.name.downcase
      names = Array.new
      names = name.split(' ')
      self.password = "1234" + names[0][0] + names[names.length-1][0]
    end
  end

  def generate_token(column)
    begin
      self[column]= SecureRandom.urlsafe_base64
    end while Parent.exists?(column => self[column])
  end

  def self.search(search)
    where(" name LIKE ?",  "%#{search}%")
  end

end
