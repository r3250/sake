class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
  @q = User.ransack(params[:q])
  @users = @q.result.order(created_at: :desc).page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
    @user_posts = @user.sake_posts.page(params[:page]).order(created_at: :desc).per(1)
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	user = User.find(params[:id])
  	user.update(user_params)
  	redirect_to admins_users_path
  end

  def destroy
    user = User.find(params[:id])
    user_posts = user.sake_posts
    user_posts.destroy
    redirect_to admins_user_path(current_admin.id)
  end

  private

  def user_params
  	params.require(:user).permit(:last_name, :first_name, :last_kana, :first_kana, :email, :favorite_sake, :favorite_shop, :favorite_drink, :introduction, :image)
  end
end
