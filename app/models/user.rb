# File name: user.rb
# Class name: User
# Description: Model used to communicate with the table 'users'
class User < ApplicationRecord
  self.inheritance_column = :permission
  validates :name, presence: { message: "não pode estar em branco" },
                   length: { minimum: 5,
                             maximum: 64,
                             :too_short => "deve possuir no mínimo 5 caracteres",
                             :too_long => "deve possuir no máximo 64 caracteres" }
  validates :classroom, presence: { message: "não pode estar em branco" },
                        length: { minimum: 2,
                                  maximum: 2,
                                  :too_short => "deve possuir 2 caracteres",
                                  :too_long => "deve possuir 2 caracteres" }
  validates :shift, presence: { message: "não pode estar em branco" },
                    length: { minimum: 2,
                              maximum: 2,
                              :too_short => "deve possuir no mínimo 8 caracteres",
                              :too_long => "deve possuir no máximo 10 caracteres" }
  def self.permissions
    ['Alumn', 'Principal']
  end

  scope :alumns, -> {where(permission:'Alumn')}
  scope :principal, -> {where(permission:'Principal')}
end
