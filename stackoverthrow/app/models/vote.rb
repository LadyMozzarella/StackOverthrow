class Vote < ActiveRecord::Base
  validates :vote, :presence => true
  belongs_to :votable, :polymorphic => true
  belongs_to :user
end