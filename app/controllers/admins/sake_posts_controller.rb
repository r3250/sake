class Admins::SakePostsController < ApplicationController
	  before_action :authenticate_admin!
	def edit
		@sake_post = SakePost.find(params[:id])
	end

	def update
		sake_post = SakePost.find(params[:id])
		sake_post.update(sake_post_params)
		redirect_to admins_sake_post_path(sake_post.id)
	end

	def destroy
		sake_post = SakePost.find(params[:id])
		sake_post.destroy
		redirect_to admins_sake_post_path(sake_post.id)
	end

	private

	def sake_post_params
   	  params.require(:sake_post).permit(:sake_name, :shop_name, :caption, :address, :image, :user_id, :name, :tag_list)
	end
end


