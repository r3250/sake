class SakeCommentsController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@sake_post = SakePost.find(params[:sake_post_id])
		@sake_comment = @sake_post.sake_comments.build(sake_comment_params)
		@sake_comment.user_id = current_user.id
		if @sake_comment.save
			render :index
	    end
	end

	def destroy
		@sake_comment = SakeComment.find(params[:id])
		if @sake_comment.destroy
			render :index
	    end
	end


	private

	def sake_comment_params
		params.require(:sake_comment).permit(:comment, :user_id, :sake_post_id)
	end
end
