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