class SakePostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_sake_post, only:[:edit, :update]

  def index
  	@sake_posts = SakePost.page(params[:page]).order(created_at: :desc)
    @sake_comment = SakeComment.new
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
    @sake_comment = SakeComment.new
    @sake_comments = @sake_post.sake_comments
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

   def correct_sake_post
    user = User.find(params[:id])
    if current_user != user
       redirect_to root_path
    end
   end

end

