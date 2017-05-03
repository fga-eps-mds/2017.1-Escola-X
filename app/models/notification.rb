class Notification < ApplicationRecord
  belongs_to :notification_emitter
  self.inheritance_column = :notification_type

  validates :title, presence: { message: "Não pode estar em branco!" },
  length: { minimum: 5,
            maximum: 80,
            :too_short => "deve possuir mais de 5 caracteres.",
            :too_long => "deve possuir no máximo 80 caracteres."}

  validates :notification_text,
            presence: {message: "A notificação deve conter conteudo em texto"},
            length: { minimum: 10,
                      :too_short => "deve possuir mais de 10 caracteres." }

  def get_date
    DateTime.now
  end

  def get_hour
    DateTime.now.time
  end

  scope :strikes, -> (receiver) { where(notification_type: 'Strike').where(notification_receiver: receiver) }
  scope :events, -> { where(notification_type: 'Event') }
  scope :suspensions, -> (receiver) { where(notification_type: 'Suspension').where(notification_receiver: receiver) }

  private
  def self.types
    [ "Strike", "Event", "Suspension" ]
  end
end
