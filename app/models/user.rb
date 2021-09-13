class User < ApplicationRecord
  has_many :subscriptions

  has_secure_password

  validates :username, uniqueness: true, presence: true
  validates :password_digest, presence: true
end
