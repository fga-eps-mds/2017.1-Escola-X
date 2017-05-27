class SchoolMiss < ApplicationRecord
  belongs_to :alumn

  validates :date, presence: { message:"Não pode estar e branco." }
end
