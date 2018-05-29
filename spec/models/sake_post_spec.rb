require 'rails_helper'

RSpec.describe SakePost, type: :model do

	context "データが正しく保存される" do
		before do
			@sake_post = SakePost.new
			@sake_post.sake_name = "いいちこ"
			@sake_post.shop_name = "コイーバ"
			@sake_post.caption = "どこでも"
			@sake_post.address = "東京"
			@sake_post.image_id = "aaaaa"
			@sake_post.user_id = 2
			@sake_post.save
		end
		it "全て入力してあるので保存される" do
		end
	end

	context"データが正しく保存されない" do
		before do
			@sake_post = SakePost.new
			@sake_post.sake_name = ""
			@sake_post.shop_name = "コイーバ"
			@sake_post.caption = "どこでも"
			@sake_post.address = "東京"
			@sake_post.image_id = "aaaaa"
			@sake_post.user_id = 2
		end
		it"データが正しく入力していないため保存されない" do
			expect(@sake_post).to be_valid
			expect(@sake_post.errors[:sake_name]).to
		end
	end
end
