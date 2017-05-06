class Notification < ApplicationRecord
  # belongs_to :notification_emitter

  validates :title, presence: { message: "Não pode estar em branco!" },
  length: { minimum: 5,
            maximum: 80,
            :too_short => "deve possuir mais de 5 caracteres.",
            :too_long => "deve possuir no máximo 80 caracteres."}

  validates :notification_text,
            presence: {message: "A notificação deve conter conteudo em texto"},
            length: { minimum: 10,
                      :too_short => "deve possuir mais de 10 caracteres." }

  validates :notification_emitter_id,
            presence: { message: "Usuário não válido para criar notificação!" }

  validates :motive, presence: { message: "Deve conter um motivo para notificação." },
                    length: {minimum: 8,
                    :too_short => "deve possuir mais de 8 caracteres."}

  def get_date
    DateTime.now
  end

  # def get_hour
  #   DateTime.now.time
  # end
end
