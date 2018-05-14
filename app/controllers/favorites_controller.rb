class FavoritesController < ApplicationController
	before_action :authenticate_user!
	def create
		sake_post = SakePost.find(params[:sake_post_id])
        favorite = current_user.favorites.new(sake_post_id: sake_post.id)
        favorite.save
        redirect_to sake_posts_path
	end

	def destroy
		sake_post = SakePost.find(params[:sake_post_id])
        favorite = current_user.favorites.find_by(sake_post_id: params[:sake_post_id])
        favorite.destroy
        redirect_to sake_posts_path
	end


end
