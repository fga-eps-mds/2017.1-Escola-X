# File name: user.rb
# Class name: User
# Description: Model used to communicate with the table 'users'
class User < ApplicationRecord
  self.inheritance_column = :permission

  def self.permissions
    ['Alumn', 'Principal']
  end

  scope :alumns, -> {where(permission:'Alumn')}
  scope :principal, -> {where(permission:'Principal')}
end
