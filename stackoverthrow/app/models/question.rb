class Question < ActiveRecord::Base
  attr_accessible :title, :text, :user_id
  validates :title, :text, :presence => true
  has_many :answers
  
  belongs_to :user
end