class Alumn < User
  validates :name, presence: true, length: { minimum }
end
