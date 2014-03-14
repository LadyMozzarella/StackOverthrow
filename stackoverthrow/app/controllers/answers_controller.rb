class AnswersController < ApplicationController
  before_filter :load_question

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(params[:answer])

    render(:new) && return unless @answer.save

    @question.answers << @answer
    redirect_to question_path(@question)
  end

  def edit
    load_answer
  end

  def update
    load_answer

    render(:edit) && return unless @answer.update_attributes(params[:answer])

    redirect_to(question_path(@question))
  end

  def destroy
    load_answer
    @answer.destroy
    redirect_to(question_path(@question))
  end

  private

  def load_question
    @question = Question.find(params[:question_id])
  end

  def load_answer
    @answer = Answer.find(params[:id])
  end
end