class Question < ActiveRecord::Base
  attr_accessible :title, :text, :vote_count
  validates :title, :text, :user_id, :presence => true
  belongs_to :user
  has_many :answers
  has_many :votes, as: :votable
end