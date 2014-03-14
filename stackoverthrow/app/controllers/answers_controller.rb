class AnswersController < ApplicationController
  before_filter :load_question

  def new
    @answer = Answer.new
  end

  def create
    if logged_in?
      @answer = @question.answers.new params[:answer]

      unless (current_user.answers << @answer) && (@question.answers << @answer)
        render(:new) && return
      end

      redirect_to(question_path(@question)) && return
    end

    redirect_to new_user_path, flash: {errors: "Not logged in"}
  end

  def edit
    load_answer
  end

  def update
    load_answer

    unless @answer.update_attributes(params[:answer]) && current_user.id == @answer.user_id
      render(:edit) && return
    end

    redirect_to(question_path(@question)) && return
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