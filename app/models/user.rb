require 'uri'

class User < ActiveRecord::Base
  has_secure_password

  has_many :tasks

  validates :email, uniqueness: true, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }
  validates :password, presence: true
  validates :username, uniqueness: true, presence: true
end
