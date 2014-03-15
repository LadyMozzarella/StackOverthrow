class Vote < ActiveRecord::Base
  attr_accessible :up_down, :votable_id, :votable_type, :user_id
  validates :up_down, :presence => true
  belongs_to :votable, polymorphic: true
  belongs_to :user
end