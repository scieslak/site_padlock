class User < ApplicationRecord

# Username validations
VALID_USERNAME_REGEX = /\A\w+\z/i
validates :name, presence: true,
                     length: { in: 3..50 }
end
