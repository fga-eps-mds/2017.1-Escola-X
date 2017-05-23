class SchoolMiss < ApplicationRecord
  belongs_to :alumn, dependent: :destroy

  validates :date, presence: { message:"Não pode estar e branco." }
end
