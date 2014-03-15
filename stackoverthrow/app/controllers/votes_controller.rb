class VotesController < ApplicationController

  def index
    @votes = @votable.votes
  end

  def new
  end

  def create
    load_votable
    p @votable.votes.find_by_user_id(session[:id]).vote
    @vote = @votable.votes.new
    @vote.user_id = session[:id]
    @vote.vote = params[:up]
    p @vote
    @vote.save

    render partial: "vote"
  end

  def destroy
  end

  private

  def load_votable
    klass = [Question, Answer].detect { |v| params["#{v.name.underscore}_id"]}
    @votable = klass.find(params["#{klass.name.underscore}_id"])
  end
end