class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new params[:question]

    redirect_to(root_path) && return if @question.save

    @questions = Question.all
    render :new
  end
end