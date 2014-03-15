class VotesController < ApplicationController

  def index
    @votes = @votable.votes
  end

  def new

  end

  def create
    load_votable
    p params
    @vote = @votable.votes.new
    @vote.user = current_user
    @votable.user_id = session[:id]
    @vote.vote = params[:up]

    @votable.votes.each do |vote|
      p vote
      p @votable
      p @votable
      redirect_to(@votable) && return if vote.user_id == @vote.user_id
    end

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