class User < ActiveRecord::Base
  attr_accessible :username, :password
  validates_presence_of :username, :password
end