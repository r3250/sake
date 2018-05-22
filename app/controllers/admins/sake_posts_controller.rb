class Admins::SakePostsController < ApplicationController
	def destroy
		
	end

	private

	def sake_post_params
   	  params.require(:sake_post).permit(:sake_name, :shop_name, :caption, :address, :image, :user_id, :name, :tag_list)
	end
end


