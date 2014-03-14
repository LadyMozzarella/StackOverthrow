class AnswersController < ApplicationController
  include ApplicationHelper
  before_filter :load_question

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(params[:answer])

    unless @answer.save && logged_in?
      @answer.errors.add(:user_id, 'must be the posting user to edit.')
      render(:new) && return
    end

    current_user.answers << @answer
    @question.answers << @answer
    redirect_to question_path(@question)
  end

  def edit
    load_answer
  end

  def update
    load_answer
    unless @answer.update_attributes(params[:answer]) && current_user.id == @answer.user_id
      @answer.errors.add(:user_id, 'must be the posting user to edit.') unless current_user.id == @answer.user_id
      render(:edit) && return
    end

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