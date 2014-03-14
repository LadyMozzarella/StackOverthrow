class Question < ActiveRecord::Base
  attr_accessible :title, :text
  validates :title, :text, :presence => true
  has_many :answers
  belongs_to :user


  def self.load_question
    @question = Question.find(params[:id])
  end
end