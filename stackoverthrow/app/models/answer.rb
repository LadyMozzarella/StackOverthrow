class Answer < ActiveRecord::Base
  attr_accessor :text
  validates :text, :presence => true
end