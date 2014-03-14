class VotesController < ApplicationController

  def index
  end

  def create

    @question = Question.find(params[:question_id])

    if params[:vote]
      @vote = Vote.create(votable_id: @question.id,
            votable_type: @question, vote: true)
    else
      @vote = Vote.create(votable_id: @question.id,
            votable_type: @question, vote: false)
    end

    # redirect question_path
    render partial: "vote"
  end

  def destroy
  end

end