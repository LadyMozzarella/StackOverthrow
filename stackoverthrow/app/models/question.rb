class Question < ActiveRecord::Base
  attr_accessible :title, :text
  validates :title, :text, :presence => true
  has_many :answers
  belongs_to :user
end