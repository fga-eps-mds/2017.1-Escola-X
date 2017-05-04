#File name: alumn.rb
#Class name: Alumn
#Description: Validates alumn's attributes
class Alumn < ApplicationRecord
  belongs_to :user , optional: true
  has_many :strike

  mount_uploader :image, ImageUploader
  validates_processing_of :image
  validate :image_size_validation
  accepts_nested_attributes_for :strike

  validates :registry, presence: { message: "não pode estar em branco" },
                      uniqueness: true,
             length: { minimum: 5,
                       maximum: 6,
                       :too_short => "deve possuir no mínimo 5 caracteres",
                       :too_long => "deve possuir no máximo 6 caracteres" }

  validates :shift, presence: { message: "não pode estar em branco" },
            length: { minimum: 7,
                      maximum: 11,
                      :too_short => "deve possuir no mínimo 7 caracteres",
                      :too_long => "deve possuir no máximo 11 caracteres" }

  private
  def image_size_validation
    errors[:image] << "deve ser menor que 600KB" if image.size > 0.6.megabytes
  end
end
