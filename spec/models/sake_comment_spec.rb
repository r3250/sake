require 'rails_helper'

RSpec.describe SakeComment, type: :model do

	context "データが正しく保存される" do
		before do
			@sake_comment = SakeComment.new
			@sake_comment.comment = "こんにちは"
			@sake_comment.save
		end
		it "全て入力してあるので保存される" do
		end
	end
	context"データが正しく保存されない" do
		before do
			@sake_comment = SakeComment.new
			@sake_comment.comment = ""
		end
		it"データが正しく入力していないため保存されない" do
			expect(@sake_comment).to be_valid
			expect(@sake_comment.errors[:comment]).to
		end
	end
end
