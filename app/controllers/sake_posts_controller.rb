class SakePostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_sake_post, only:[:edit, :update, :destroy]

  def index
    search_sake_posts = [] # 分岐文sakeを代入
    SakePost.all.order(created_at: :desc).each do |sake|
      if sake.user.deleted_at.blank? # created_atが空の場合
        search_sake_posts << sake
      end
    end
    if params[:tag_list].present?
          @search_sake_posts = SakePost.tagged_with(params[:tag_list]).order(created_at: :desc).sake # sake_post.rbにてsakeを定義
          @search_sake_posts = Kaminari.paginate_array(@search_sake_posts).page(params[:page]).per(4)
    else
      @search_sake_posts = search_sake_posts
      @search_sake_posts = Kaminari.paginate_array(@search_sake_posts).page(params[:page]).per(4)
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
  	if sake_post.save
  	   redirect_to sake_posts_path
    else
       @sake_post = sake_post
       render :new
    end
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
  	if sake_post.update(sake_post_params)
  	redirect_to sake_post_path(sake_post)
    else
      @sake_post = sake_post
      render :edit
    end

  end

  def destroy
  	sake_post = SakePost.find(params[:id])
  	if admin_signed_in?
       sake_post.destroy
  	   redirect_to admins_user_path(sake_post.id)
    else
       sake_post.destroy
       redirect_to sake_posts_path
    end

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

