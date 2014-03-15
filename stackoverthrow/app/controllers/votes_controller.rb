class VotesController < ApplicationController

  def index
    @votes = @votable.votes
  end

  def new

  end

  def create
    load_votable
    p params
    @vote = @votable.votes.find_or_create_by_user_id_and_votable_id(current_user.id, @votable.id)
    @vote.user = current_user
    @votable.user_id = session[:id]
    @vote.up_down = params[:up_down]
    @vote.save

    @number = 0
    @votable.votes.each{|vote| @number += vote.up_down }

    redirect_to(@votable, number: @number)
  end

  def destroy
  end

  private

  def load_votable
    klass = [Question, Answer].detect { |v| params["#{v.name.underscore}_id"]}
    @votable = klass.find(params["#{klass.name.underscore}_id"])
  end
end