class UsersController < ApplicationController
    before_action :authenticate_user!, except: [:user_post, :show]
    before_action :correct_user, only:[:show, :edit, :update]
  def user_post
    @user = User.find(params[:id])
    @user_posts = @user.sake_posts.page(params[:page]).order(created_at: :desc).per(5)
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	user = User.find(params[:id])
  	user.update(user_params)
  	redirect_to user_path(user.id)
  end

  private

  def user_params
  	params.require(:user).permit(:last_name, :first_name, :last_kana, :first_kana, :email, :favorite_sake, :favorite_shop, :favorite_drink, :introduction, :image)
  end
  def correct_user
    user = User.find(params[:id])
    if current_user != user
       redirect_to root_path
    end
  end
end
