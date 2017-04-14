class Parent < ApplicationRecord
  belongs_to :user, optional: true
end
