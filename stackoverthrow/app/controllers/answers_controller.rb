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

  def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])

    render(:edit) && return unless @answer.update_attributes(params[:answer])

    redirect_to(question_path(@question))
  end

  def destroy
    # @question = Question.find(params[:id])
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to(root_path)
  end
end