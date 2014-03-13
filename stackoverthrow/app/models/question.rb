class Question < ActiveRecord::Base
  validates :title, :text, :presence => true
end