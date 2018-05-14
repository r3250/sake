# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180512124528) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "sake_post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sake_post_id"], name: "index_favorites_on_sake_post_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "retires", force: :cascade do |t|
    t.text "retire_reason"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_retires_on_user_id"
  end

  create_table "sake_comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "sake_post_id"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sake_post_id"], name: "index_sake_comments_on_sake_post_id"
    t.index ["user_id"], name: "index_sake_comments_on_user_id"
  end

  create_table "sake_posts", force: :cascade do |t|
    t.string "sake_name", default: "いいちこ", null: false
    t.string "shop_name"
    t.text "caption", default: "どこでも買えるお酒", null: false
    t.string "address"
    t.float "longitude"
    t.float "latitude"
    t.text "image_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sake_posts_on_user_id"
  end

  create_table "sake_tags", force: :cascade do |t|
    t.integer "sake_post_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sake_post_id"], name: "index_sake_tags_on_sake_post_id"
    t.index ["tag_id"], name: "index_sake_tags_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", default: "いいちこ", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name", default: "田中", null: false
    t.string "first_name", default: "太郎", null: false
    t.string "last_kana", default: "タナカ", null: false
    t.string "first_kana", default: "タロウ", null: false
    t.string "nickname", default: "サンプル", null: false
    t.string "favorite_sake"
    t.string "favorite_drink"
    t.string "favorite_shop"
    t.text "introduction"
    t.datetime "deleted_at"
    t.text "image_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
