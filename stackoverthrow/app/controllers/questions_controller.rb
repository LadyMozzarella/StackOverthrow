class QuestionsController < ApplicationController
  include ApplicationHelper

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new params[:question]

    if @question.save && logged_in?
      current_user.questions << @question
      redirect_to(root_path) && return
      debugger
    end

    @question.errors.add(:user_id, 'must be the posting user to edit.')
    @questions = Question.all
    render :new
  end

  def show
    load_question
    @answers = @question.answers
  end

  def edit
    load_question
  end

  def update
    load_question

    render(:edit) && return unless @question.update_attributes(params[:question])

    redirect_to(question_path(@question))
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