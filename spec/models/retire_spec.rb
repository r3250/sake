require 'rails_helper'

RSpec.describe Retire, type: :model do
		context "データが正しく保存される" do
		before do
			@@Retire = Retire.new
			@@Retire.retire_reason = "こんにちは"
			@@Retire.save
		end
		it "全て入力してあるので保存される" do
		end
	end
	context"データが正しく保存されない" do
		before do
			@@Retire = Retire.new
			@@Retire.retire_reason = ""
		end
		it"データが正しく入力していないため保存されない" do
			expect(@@Retire).to be_valid
			expect(@@Retire.errors[:retire_reason]).to
		end
	end
end
