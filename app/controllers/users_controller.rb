class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :correct_user, only:[:show, :edit, :update]

  def user_post
    @user = User.find(params[:id])
    @user_posts = @user.sake_posts.order(created_at: :desc)
    @user_favorites = @user.favorites.order(created_at: :desc)
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	user = User.find(params[:id])
  	if user.update(user_params)
  	   redirect_to user_path(user.id)
    else
       @user = user
       render :edit
    end
  end

  private

  def user_params
  	params.require(:user).permit(:last_name, :first_name, :last_kana, :first_kana, :email, :favorite_sake, :favorite_shop, :favorite_drink, :introduction, :image, :nickname)
  end
  def correct_user
    user = User.find(params[:id])
    if current_user != user
       redirect_to root_path
    end
  end
end
