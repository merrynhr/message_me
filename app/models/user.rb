class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { minimum: 2, maximum: 20 }
  has_many :messages
  has_secure_password
end
