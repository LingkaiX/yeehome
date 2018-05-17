class User < ApplicationRecord
    enum role: [:admin, :editor]
    validates :name, presence: true
    before_save { self.email = email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    after_initialize :init
    def init
      self.role ||= 0
    end

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }

end
