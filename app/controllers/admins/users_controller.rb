class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
  	@users = User.all
  end

  def edit
  	@user = User.find(params[:id])
  	@users = @user.sake_posts
  end

  def update
  	user = User.find(params[:id])
  	user.update(user_params)
  	redirect_to admins_user_path(user.id)
  end

  private

  def user_params
  	params.require(:user).permit(:last_name, :first_name, :last_kana, :first_kana, :email, :favorite_sake, :favorite_shop, :favorite_drink, :introduction, :image)
  end
end
