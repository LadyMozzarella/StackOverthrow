class VotesController < ApplicationController

  def index
    @votes = @votable.votes
  end


  def new
  end


  def create
    load_votable
    redirect_to(new_user_path) && return unless logged_in?

    @vote = Vote.new
    path = @vote.get_redirect_path(@votable)
    redirect_to(path) && return if @votable.votes.find_by_user_id(current_user.id)
    up_or_down = params[:up_down].to_i

    @vote = @votable.votes.create(user_id: current_user.id, up_down: up_or_down)
    @vote.update_count(@votable, up_or_down)
    @vote.save

    redirect_to(path)
  end

  def destroy
  end

  private

  def load_votable
    klass = [Question, Answer].detect { |v| params["#{v.name.underscore}_id"]}
    @votable = klass.find(params["#{klass.name.underscore}_id"])
  end
end