class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :username, :password, :password_confirmation
  validates_presence_of :username
  has_many :questions
  has_many :answers
  
end