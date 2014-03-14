class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(params[:answer])

    render(:new) && return unless @answer.save

    @question.answers << @answer
    redirect_to question_path(@question)
  end
end