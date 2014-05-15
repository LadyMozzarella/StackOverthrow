class Comment < ActiveRecord::Base
  attr_accessible :commentable_id, :commentable_type, :opinion
  validates :opinion, :presence => true
  belongs_to :commentable, polymorphic: true
  belongs_to :user
end