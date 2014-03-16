class VotesController < ApplicationController

  def index
    @votes = @votable.votes
  end

  def new

  end

  def create
    load_votable
    redirect_to(new_user_path) && return unless logged_in?

    if @votable.class.name == "Question"
      redirect_to(@votable) && return if @votable.votes.find_by_user_id(current_user.id)
    else
      redirect_to(@votable.question) && return if @votable.votes.find_by_user_id(current_user.id)
    end

    @votable.vote_count += params[:up_down].to_i
    @votable.save
    @vote = @votable.votes.create(user_id: current_user.id)
    @vote.user = current_user
    @vote.up_down = params[:up_down]
    @vote.save

    respond_to do |format|
      format.html { redirect_to @votable }
      format.js
    end

    # if @votable.class.name == "Question"
    #   redirect_to(@votable)
    # else
    #   redirect_to(@votable.question)
    # end

  end

  def destroy
  end

  private

  def load_votable
    klass = [Question, Answer].detect { |v| params["#{v.name.underscore}_id"]}
    @votable = klass.find(params["#{klass.name.underscore}_id"])
  end
end