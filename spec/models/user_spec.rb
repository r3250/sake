require 'rails_helper'

RSpec.describe User, type: :model do

  context "データが正しく保存される" do
        before do
            @user = User.new
            id = 1
            @user.last_name = "田中"
            @user.first_name = "太郎"
            @user.nickname = "太郎"
            @user.first_kana = "タナカ"
            @user.last_kana = "タロウ"
            @user.email = "1@1"
            @user.favorite_sake = "いいちこ"
            @user.favorite_drink = "ロック"
            @user.favorite_shop = "コンビニ"
            @user.introduction = "こんにちは"
            @user.password = "111111"
            @user.save
        end
        it "全て入力してあるので保存される" do
            expect(@user).to be_valid
        end
    end
        context"データが正しく保存されない" do
        	before do
            @user = User.new
            @user.last_name = "田中"
            @user.first_name = "太郎"
            @user.nickname = "太郎"
            @user.first_kana = "タナカ"
            @user.last_kana = "タロウ"
            @user.email = "1@1"
            @user.password = ""
            @user.save
        end
        it"データが正しく入力していないため保存されない" do
        	expect(@user).to be_valid
        	expect(@user.errors[:last_name, :last_kana, :first_kana, :nickname, :first_name, :email, :password]).to 
        end
    end
end
