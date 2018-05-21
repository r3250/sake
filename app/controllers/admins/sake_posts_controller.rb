class Admins::SakePostsController < ApplicationController
	def new
		@sake_post = SakePost.new
	end

	def create
		sake_post = SakePost.new(admin_sake_posts_params)
		sake_post.admin_id == current_admin.id
		sake_post.save
		redirect_to admins_tags_path
	end

	private

	def admin_sake_posts_params
   	  params.require(:sake_post).permit(:sake_name, :shop_name, :caption, :address, :image, :user_id, :name, :tag_list)
	end

end


