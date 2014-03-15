class VotesController < ApplicationController

  def index
    @votes = @votable.votes
  end

  def new

  end

  def create
    load_votable
    redirect_to(new_user_path) && return unless logged_in?
    redirect_to(@votable) && return if @votable.votes.find_by_user_id(current_user.id)
    @votable.vote_count += params[:up_down].to_i
    @votable.save
    @vote = @votable.votes.create(user_id: current_user.id)
    @vote.user = current_user
    @vote.up_down = params[:up_down]
    @vote.save

    redirect_to(@votable) #:controller => @votable.class.name.downcase + 's', :action => 'show', :id => @votable.id, votecount: @number
  end

  def destroy
  end

  private

  def load_votable
    klass = [Question, Answer].detect { |v| params["#{v.name.underscore}_id"]}
    @votable = klass.find(params["#{klass.name.underscore}_id"])
  end
end