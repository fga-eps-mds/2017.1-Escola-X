#File name: alumn.rb
#Class name: Alumn
#Description: Validates alumn's attributes
class Alumn < ApplicationRecord
  belongs_to :parent
  belongs_to :classroom
  belongs_to :grade
  has_many :strikes
  has_many :school_misses
  has_many :grades
  has_many :subjects, through: :grades

  has_secure_password

  before_create :initialize_strikes
  before_save :validates_password
  # after_save :initialize_grades
  has_many :suspensions




  def initialize_strikes
    self.quantity_strike ||= 0
  end

  # def initialize_grades
  #   @classroom = Classroom.find(self.classroom_id)
  #   if !@classroom.subjects.nil?
  #     @classroom.subjects.each do |subject|
  #       Grade.create!(alumn_id: self.id, subject_id: subject.id,
  #                     classroom_id: self.classroom_id)
  #     end
  #   end
  # end


  before_create{
    generate_token(:authorization_token)
  }

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


  validates :birth_date, presence: { message: "Não pode estar em branco." }

  validates :name, presence: { message: "não pode estar em branco" },
            length: { minimum: 5,
                      maximum: 64,
                      :too_short => "deve possuir no mínimo 5 caracteres",
                      :too_long => "deve possuir no máximo 64 caracteres" }

  validates :address, presence: { message: "não pode estar em branco" },
            length: { minimum: 5,
                      maximum: 64,
                      :too_short => "deve possuir no mínimo 5 caracteres",
                      :too_long => "deve possuir no máximo 64 caracteres" }

  validates :phone, length: { in: 10..11,
                              :too_short => "deve possuir no mínimo 10 dígitos",
                              :too_long => "deve possuir no máximo 11 dígitos" }

  validates :gender, presence: { message: "Não pode estar em branco." }

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
  def validates_password
    if self.password_digest.nil?
      validates :password, presence:true,
      length: { minimum: 8}
    end
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
