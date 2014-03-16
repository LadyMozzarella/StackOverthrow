class CommentsController < ApplicationController
	def new
		@commentable = load_commentable
		@comment = Comment.new
	end

	def create
		@commentable = load_commentable
		@comment = @commentable.comments.build(params[:comment])
		@comment.user_id=session[:id]
		if @comment.save
			flash[:notice] = "Successfully created comment."
			redirect_to @commentable
		else
			render :action => 'new'
		end
	end


	private

	def load_commentable
    	# klass = [Question, Answer].detect { |v| params["#{v.name.underscore}_id"]}
    	# @votable = klass.find(params["#{klass.name.underscore}_id"])

    	params.each do |name, value|
			return $1.classify.constantize.find(value) if name =~ /(.+)_id$/
			
		end
  	end
end
