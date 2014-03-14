class User < ActiveRecord::Base
  attr_accessible :username, :password
  validates_presence_of :username, :password
  has_many :questions
  has_many :answers
  has_many :votes
end