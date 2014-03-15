class Vote < ActiveRecord::Base
  attr_accessible :vote, :votable_id, :votable_type, :user_id
  validates :vote, :presence => true
  belongs_to :votable, polymorphic: true
  belongs_to :user
end