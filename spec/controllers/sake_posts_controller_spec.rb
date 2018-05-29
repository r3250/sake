require 'rails_helper'

RSpec.describe SakePostsController, type: :controller do

	describe '一覧ページ' do
		context"一覧ページが正しく表示される" do
			before do
				get :index
			end
			render_views
			it 'タイトルが正しく表示されていること' do
				expect(response.body).to include("酒")
			end
		end
	end
	# describe '詳細ページ' do
	# 	context"詳細ページが正しく表示される" do
	# 		before do
	# 			@data = post :create, params
	# 			get :show,params: {id: @date.id}
	# 		end
	# 		render_views
	# 		it 'タイトルが正しく表示されていること' do
	# 			expect(response.body).to
	# 		end
	# 	end
	# end
	describe '投稿ページ' do
		context"投稿ページが正しく表示される" do
			before do
				get :new
			end
			render_views
			it 'タイトルが正しく表示されていること' do
				expect(response.status).to eq 302
				expect(response.body).to include("ユーザー名")
			end
		end
	end

end
