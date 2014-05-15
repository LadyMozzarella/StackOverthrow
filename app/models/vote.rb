class Vote < ActiveRecord::Base
  attr_accessible :up_down, :votable_id, :votable_type, :user_id
  validates :up_down, :presence => true
  belongs_to :votable, polymorphic: true
  belongs_to :user

  def get_redirect_path(votable)
    if votable.class.name == "Question"
      votable
    else
      votable.question
    end
  end

  def update_votable_count(votable, up_or_down)
    votable.vote_count += up_or_down
    votable.save
  end

end