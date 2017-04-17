#File name:user.rb
#Class name: User
#Description: Validates the requeriments made by the controller and saves in the
#            data base
class User < ApplicationRecord
  has_one :parent, autosave: true, dependent: :destroy
  has_one :alumn, autosave: true, dependent: :destroy

  accepts_nested_attributes_for :parent
  accepts_nested_attributes_for :alumn

  validates :birth_date, presence: { message: "Não pode estar em branco." }

  validates :name, presence: { message: "não pode estar em branco" },
                   length: { minimum: 5,
                             maximum: 64,
                             :too_short => "deve possuir no mínimo 5 caracteres",
                             :too_long => "deve possuir no máximo 64 caracteres" }
  validates :address, presence: { message: "não pode estar em branco" },
                   length: { minimum: 5,
                             maximum: 64,
                             :too_short => "deve possuir no mínimo 5 caracteres",
                             :too_long => "deve possuir no máximo 64 caracteres" }
  validates :phone, length: { in: 10..11,
                              :too_short => "deve possuir no mínimo 10 dígitos",
                              :too_long => "deve possuir no máximo 11 dígitos" }

  has_secure_password
  validates :password, presence:true,
                        length: { minimum: 8}

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
