class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :username, :password, :password_confirmation, :reputation
  validates_presence_of :username
  has_many :questions
  has_many :answers
  has_many :votes

  def update_reputation(vote)
  	self.reputation += vote.up_down
  	self.save
  end
end