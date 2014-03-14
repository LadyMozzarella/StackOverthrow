class Question < ActiveRecord::Base
  attr_accessible :title, :text
  validates :title, :text, :presence => true
  belongs_to :user
  has_many :answers
  has_many :votes, :as => :votable
end