class User < ActiveRecord::Base
  has_many :secrets
  has_many :likes
  has_many :liked_secrets, through: :likes, source: :secret

  has_secure_password

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :name, presence: true
  validates :email,  presence: true, uniqueness: {case_sensitive: false }, format: { with: EMAIL_REGEX }

  before_save :email_lowercase

  def email_lowercase
    email.downcase
  end
end
