class UsersController < ApplicationController
  def index
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
  	params.require(:user).permit(:last_name, :first_name, :last_kana, :first_kana, :email, :favorite_sake, :favorite_shop, :favorite_drink, :introduction)
  end
end
