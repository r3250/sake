class SakePostsController < ApplicationController
  def index
  	@sake_posts = SakePost.order(created_at: :desc).page(params[:page]).per(3)
  end

  def new
  end

  def show
  	@sake_post = SakePost.find(params[:id])
  end

  def edit
  end
end
