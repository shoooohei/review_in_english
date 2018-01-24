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

ActiveRecord::Schema.define(version: 20180123221140) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clikes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "correction_id"
    t.integer "LikesCount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["correction_id"], name: "index_clikes_on_correction_id"
    t.index ["user_id"], name: "index_clikes_on_user_id"
  end

  create_table "corrections", force: :cascade do |t|
    t.text "content"
    t.bigint "review_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "wether_correction", default: false
    t.integer "likes_count", default: 0
    t.index ["review_id"], name: "index_corrections_on_review_id"
    t.index ["user_id"], name: "index_corrections_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "jp_title"
    t.string "en_title"
    t.text "image"
    t.text "star"
    t.string "director"
    t.string "writer"
    t.integer "playyear"
    t.string "country"
    t.text "imdb"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["en_title"], name: "index_movies_on_en_title", unique: true
    t.index ["jp_title"], name: "index_movies_on_jp_title", unique: true
  end

  create_table "phrases", force: :cascade do |t|
    t.bigint "review_id"
    t.text "content"
    t.text "comment"
    t.integer "likes_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_phrases_on_review_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.bigint "movie_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "likes_count", default: 0
    t.float "rate", default: 0.0
    t.index ["movie_id"], name: "index_reviews_on_movie_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "rlikes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_rlikes_on_review_id"
    t.index ["user_id"], name: "index_rlikes_on_user_id"
  end

  create_table "user_icons", force: :cascade do |t|
    t.bigint "user_id"
    t.text "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_icons_on_user_id"
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "clikes", "corrections"
  add_foreign_key "clikes", "users"
  add_foreign_key "phrases", "reviews"
  add_foreign_key "reviews", "movies"
  add_foreign_key "reviews", "users"
  add_foreign_key "rlikes", "reviews"
  add_foreign_key "rlikes", "users"
  add_foreign_key "user_icons", "users"
end
