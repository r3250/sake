class Admins::UsersController < ApplicationController
  def index
  @q = User.ransack(params[:q])
  @users = @q.result.order(created_at: :desc).page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
    @user_posts = @user.sake_posts
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	user = User.find(params[:id])
  	user.update(user_params)
  	redirect_to admins_users_path
  end

  private

  def user_params
  	params.require(:user).permit(:last_name, :first_name, :last_kana, :first_kana, :email, :favorite_sake, :favorite_shop, :favorite_drink, :introduction, :image)
  end
end
