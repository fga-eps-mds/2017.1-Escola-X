class User < ApplicationRecord
  has_one :parent, autosave: true ,dependent: :destroy

  accepts_nested_attributes_for :parent

  validates :birth_date, presence: { message: "Não pode estar em branco." }

end
