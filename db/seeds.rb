# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(:last_name => '田中', :first_name => '太郎', :last_kana => 'タナカ', :first_kana => 'タロウ', :email => 'test@test', :nickname => 'てすとちゃん', :favorite_sake => 'いいちこ', :favorite_drink => 'ソーダ割り', :favorite_shop => '酒の格安', :introduction => 'お酒は弱いです', :password => '00000000')
User.create(:last_name => '山田', :first_name => '太郎', :last_kana => 'ヤマダ', :first_kana => 'タロウ', :email => 'a@a', :nickname => 'タロウちゃん', :favorite_sake => '佐藤', :favorite_drink => 'ロック', :favorite_shop => '鳥貴族', :introduction => 'お酒は強いです', :password => '11111111')
User.create(:last_name => '加藤', :first_name => '太郎', :last_kana => 'カトウ', :first_kana => 'タロウ', :email => 'b@b', :nickname => 'カトウちゃん', :favorite_sake => '赤霧島', :favorite_drink => '水割り', :favorite_shop => 'つぼ八', :introduction => 'お酒は好きです', :password => '22222222')
User.create(:last_name => '山本', :first_name => '太郎', :last_kana => 'ヤマモト', :first_kana => 'タロウ', :email => 'c@c', :nickname => 'ちゃん', :favorite_sake => '黒霧島', :favorite_drink => 'ストレート', :favorite_shop => '和民', :introduction => 'お酒を飲みます', :password => '33333333')
User.create(:last_name => '千葉', :first_name => '太郎', :last_kana => 'チバ', :first_kana => 'タロウ', :email => 'd@d', :nickname => 'ちゃんこ', :favorite_sake => '中々', :favorite_drink => '水割り', :favorite_shop => '笑笑', :introduction => 'お酒は辛いです', :password => '44444444')
User.create(:last_name => '佐藤', :first_name => '太郎', :last_kana => 'サトウ', :first_kana => 'タロウ', :email => 'f@f', :nickname => 'カトちゃん', :favorite_sake => '兼八', :favorite_drink => 'ロック', :favorite_shop => '座和民', :introduction => 'お酒は甘いです', :password => '55555555')

SakeComment.create(:user_id =>1, :sake_post_id =>1, :comment => "美味しいお酒")
SakeComment.create(:user_id =>2, :sake_post_id =>2, :comment => "まずいお酒")
SakeComment.create(:user_id =>3, :sake_post_id =>3, :comment => "うまいお酒")
SakeComment.create(:user_id =>1, :sake_post_id =>3, :comment => "うまくないお酒")
SakeComment.create(:user_id =>1, :sake_post_id =>2, :comment => "うまくないお酒")
SakeComment.create(:user_id =>8, :sake_post_id =>2, :comment => "うまくないお酒")
SakeComment.create(:user_id =>8, :sake_post_id =>3, :comment => "美味しいお酒")

admin = Admin.new(:email => 'test2@test2', :password => 'password')
admin.save!