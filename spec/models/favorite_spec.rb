require 'rails_helper'

RSpec.describe Favorite, type: :model do
			context "データが正しく保存される" do
		before do
			@favorite = Favorite.new
			@favorite.user_id = 1
			@favorite.sake_post_id = 1
			@favorite.save
		end
		it "全て入力してあるので保存される" do
		end
	end
	context"データが正しく保存されない" do
		before do
			@favorite = Favorite.new
			@favorite.user_id = 1
			@favorite.sake_post_id = 1
		end
		it"データが正しく入力していないため保存されない" do
			expect(@favorite).to be_valid
			expect(@favorite.errors[:user_id, :sake_post_id]).to
		end
	end

end
