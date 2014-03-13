class QuestionsController < ApplicationController
  def index
  end

  def new
    @question = Question.new
  end

  def create
    p params
    @question = Question.new params[:question]
    @question.save
    redirect_to root_path
  end
end