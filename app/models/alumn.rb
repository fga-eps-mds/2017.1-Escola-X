class Alumn < User
  validates :name, presence: true, length: { minimum: 2 }
end
