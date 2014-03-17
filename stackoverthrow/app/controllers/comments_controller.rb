class CommentsController < ApplicationController
	def new
		@commentable = load_commentable
		@comment = Comment.new
	end

	def create

		if logged_in?
			@commentable = load_commentable
			@comment = @commentable.comments.build(params[:comment])
			@comment.user_id=session[:id]
			if @comment.save
				flash[:notice] = "Successfully created comment."
				if @commentable.class.name == "Answer"
					redirect_to @commentable.question
				else
					redirect_to @commentable
				end
			else
				render :action => 'new'
			end
		else 
			redirect_to new_session_path, flash: {errors: "Not logged in"}
		end
	end

	private

	def load_commentable
    	params.each do |name, value|
			return $1.classify.constantize.find(value) if name =~ /(.+)_id$/
		end
  	end
end
