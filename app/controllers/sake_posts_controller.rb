class SakePostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_sake_post, only:[:edit, :update]

  def index
       search_sake_posts = []
       SakePost.all.order(created_at: :desc).each do |sake|
        if sake.user.deleted_at.blank?
          search_sake_posts << sake
        end
      end
    if params[:tag_list].present?
      @search_sake_posts = SakePost.tagged_with(params[:tag_list]).page(params[:page]).order(created_at: :desc).per(5)
    else
      @search_sake_posts = []

      SakePost.all.order(created_at: :desc).each do |sake|
        if sake.user.deleted_at.blank?
          @search_sake_posts << sake
        end
      end
      @search_sake_posts = Kaminari.paginate_array(@search_sake_posts).page(params[:page]).per(4)
      @sake_comment = SakeComment.new
   end
  end

  def new
  	@sake_post = SakePost.new
  end

  def create
    sake_post = SakePost.new(sake_post_params)
    sake_post.user_id = current_user.id
    sake_post.tag_list.clear # 送られてきたTagを消してきれいにする
    ary = params[:sake_post][:tag_list].split(",").to_a # 送信されたパラメータを分解して配列にする
    sake_post.tag_list.add(ary) # 配列にしたものをtagに追加する
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
      @tag_list = @sake_post.tag_list.to_s
  end

  def update
  	sake_post = SakePost.find(params[:id])
    sake_post.tag_list.clear
    ary = params[:sake_post][:tag_list].split(",").to_a
    sake_post.tag_list.add(ary)
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
   	  params.require(:sake_post).permit(:sake_name, :shop_name, :caption, :address, :image, :user_id, :name, :tag_list)
   end

   def correct_sake_post
    sake_post = SakePost.find(params[:id])
    if current_user.id != sake_post.user_id
       redirect_to root_path
    end
   end

end

