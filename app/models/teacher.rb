class Teacher < Employee
  belongs_to :employee
    has_secure_password
      before_save :validates_password
      validates :employee_cpf, :cpf => true
      validates :registry, presence: true


      validates :shift, presence: { message: "não pode estar em branco" },
                length: { minimum: 7,
                          maximum: 11,
                          :too_short => "deve possuir no mínimo 7 caracteres",
                          :too_long => "deve possuir no máximo 11 caracteres" }

      validates :birth_date, presence: { message: "Não pode estar em branco." }

      validates :gender, presence: { message: "Não pode estar em branco." }

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



      before_create{
        generate_token(:authorization_token)
      }

      def get_age
        DateTime.now.year - self.birth_date.year
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
        end while Teacher.exists?(column => self[column])
      end
end
