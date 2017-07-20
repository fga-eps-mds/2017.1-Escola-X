#File name: alumn.rb
#Class name: Alumn
#Description: Validates alumn's attributes
class Alumn < ApplicationRecord
  belongs_to :parent
  belongs_to :classroom
  belongs_to :shift

  has_many :strikes
  has_many :school_misses
  has_many :grades
  has_many :subjects, through: :grades
  has_many :suspensions

  has_secure_password validations: false
  before_create :initialize_strikes
  before_save :set_password

  has_many :suspensions
  has_attached_file :image, :styles => { :original => "250x300>"},
  :storage => :dropbox,
  :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
  :dropbox_visibility => 'public'


  def initialize_strikes
    self.quantity_strike ||= 0
  end

  before_create{
    generate_token(:authorization_token)
  }

  validates :registry, presence: { message: "não pode estar em branco" },
                      uniqueness: true,
             length: { minimum: 5,
                       maximum: 6,
                       :too_short => "deve possuir no mínimo 5 caracteres",
                       :too_long => "deve possuir no máximo 6 caracteres" }

  validates :name, presence: { message: "não pode estar em branco" },
            length: { minimum: 5,
                      maximum: 64,
                      :too_short => "deve possuir no mínimo 5 caracteres",
                      :too_long => "deve possuir no máximo 64 caracteres" }

  validates :gender, presence: { message: "Não pode estar em branco." }

  validates :bar_code, uniqueness: true

  def get_age
    DateTime.now.year - self.birth_date.year
  end

  def self.current=(a)
    @current_alumn = a
  end

  def self.current
    @current_alumn
  end


  private
  def set_password
    self.password = self.registry
  end

  def generate_token(column)
    begin
      self[column]= SecureRandom.urlsafe_base64
    end while Alumn.exists?(column => self[column])
  end

  def image_size_validation
    errors[:image] << "deve ser menor que 600KB" if image.size > 0.6.megabytes
  end

  def self.search(search)
    where("registry LIKE ? OR name LIKE ?", "#{search}", "%#{search}%")
  end
end
