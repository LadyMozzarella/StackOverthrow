class QuestionsController < ApplicationController
  def index
    @questions = Question.all.sort! {|a,b| b.vote_count <=>  a.vote_count}
  end

  def new
    @question = Question.new
  end

  def create
    if logged_in?
      @question = current_user.questions.new params[:question]

      render(:new) && return unless (current_user.questions << @question)
      redirect_to(root_path) && return
    end

    redirect_to new_user_path, flash: {errors: "Not logged in"}
  end

  def show
    load_question
    @votable = @question
    @answers = @question.answers
    @votes = @votable.votes
  end

  def edit
    load_question
  end

  def update
    load_question

    unless @question.update_attributes(params[:question]) && @question.user_id == current_user.id
      render(:edit) && return
    end
    redirect_to(question_path(@question)) && return
  end

  def destroy
    load_question
    @question.destroy
    redirect_to(root_path)
  end

  private

  def load_question
    @question = Question.find(params[:id])
  end
end