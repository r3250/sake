class SakePostsController < ApplicationController
	before_action :authenticate_user!, expect: [:index, :show]
  def index
  	@sake_posts = SakePost.all.order(created_at: :desc)
  end

  def new
  	@sake_post = SakePost.new
  end

  def create
    sake_post = SakePost.new(sake_post_params)
    sake_post.user_id = current_user.id
  	sake_post.save
  	redirect_to sake_posts_path
  end

  def show
  	@sake_post = SakePost.find(params[:id])
  end

  def edit
  	@sake_post = SakePost.find(params[:id])
  end
  def update
  	sake_post = SakePost.find(params[:id])
  	sake_post.update(sake_post_params)
  	redirect_to sake_post_path(sake_post)
  end

  def destroy
  	sake_post = SakePost.find(params[:id])
  	sake_post.destroy
  	redirect_to sake_posts_path
  end

   private

   def sake_post_params
   	  params.require(:sake_post).permit(:sake_name, :shop_name, :caption, :address, :image, :user_id)
   end


end
