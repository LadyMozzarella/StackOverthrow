class VotesController < ApplicationController

  def index
    @votes = @votable.votes
  end

  def new
    load_votable
    @vote = @votable.votes.new
  end

  def create


    # @question = Question.find(params[:question_id])

    # if params[:vote]
    #   @vote = Vote.create(votable_id: @question.id,
    #         votable_type: @question, vote: true)
    # else
    #   @vote = Vote.create(votable_id: @question.id,
    #         votable_type: @question, vote: false)
    # end

    # # redirect question_path
    # render partial: "vote"
  end

  def destroy
  end

  private

  def load_votable
    klass = [Question, Answer].detect { |v| params["#{v.name.underscore}_id"]}
    @votable = klass.find(params["#{klass.name.underscore}_id"])
  end
end