class User < ApplicationRecord

before_save :downcase_email

# Username validations
VALID_USERNAME_REGEX = /\A\w+\z/i
validates :name, presence: true,
                     length: { in: 3..50 }

# Email validations
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+\.([a-z\d\-]+\.)*[a-z]{2,}\z/i
validates :email, presence: true,
                  length: { maximum: 255 },
                  format: { with: VALID_EMAIL_REGEX },
                  uniqueness: { case_sensitive: false }



  def downcase_email
    self.email = email.downcase
  end
end
