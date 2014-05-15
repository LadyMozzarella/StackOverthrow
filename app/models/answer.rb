class Answer < ActiveRecord::Base
  attr_accessible :text, :vote_count
  validates :text, :question_id, :user_id, :presence => true
  belongs_to :question
  belongs_to :user
  has_many :votes, :as => :votable
  has_many :comments, as: :commentable
end