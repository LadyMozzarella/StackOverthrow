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
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    render(:edit) && return unless @question.update_attributes(params[:question])

    redirect_to(question_path(@question))
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to(root_path)
  end
end