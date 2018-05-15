class UsersController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :correct_user, only:[:edit, :update]
  def index
    @users = current_user.sake_posts
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
  def correct_userp
    user = User.find(params[:id])
    if current_user != user
       redirect_to root_path
    end
   end

end
