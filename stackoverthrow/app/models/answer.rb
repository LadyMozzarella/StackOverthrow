class Answer < ActiveRecord::Base
  attr_accessible :text
  validates :text, :presence => true
  belongs_to :question
  belongs_to :user
end