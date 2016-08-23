class User < ActiveRecord::Base

    has_secure_password
    has_many :articles, dependent: :destroy
    before_save { self.email = email.downcase }

    # uniqueness - Esto es para asegurar que la columna sea unica.
    # presence - Asegura la presencia de la columna a la hora de crear una entidad.
    validates :username, presence: true,
                         uniqueness: { case_sensitive: false },
                         length: { minimun: 3, maximum: 25 }

    # Regex for email validation.
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    # User email validation with a presence of regex patter.
    validates :email, presence: true,
                      uniqueness: { case_sensitive: false },
                      length: { maximum: 105 },
                      format: { with: VALID_EMAIL_REGEX }

end
