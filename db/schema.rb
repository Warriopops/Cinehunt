# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_11_28_113442) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorite_lists", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_favorite_lists_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "favorite_list_id", null: false
    t.bigint "scene_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["favorite_list_id"], name: "index_favorites_on_favorite_list_id"
    t.index ["scene_id"], name: "index_favorites_on_scene_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.string "lat"
    t.string "long"
    t.string "country"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "scene_id", null: false
    t.bigint "user_id", null: false
    t.string "content"
    t.float "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scene_id"], name: "index_reviews_on_scene_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "scenes", force: :cascade do |t|
    t.bigint "place_id", null: false
    t.bigint "movie_id", null: false
    t.bigint "user_id", null: false
    t.float "rating"
    t.string "content"
    t.float "price"
    t.boolean "payant"
    t.string "time"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_scenes_on_movie_id"
    t.index ["place_id"], name: "index_scenes_on_place_id"
    t.index ["user_id"], name: "index_scenes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "bio"
    t.boolean "certification"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favorite_lists", "users"
  add_foreign_key "favorites", "favorite_lists"
  add_foreign_key "favorites", "scenes"
  add_foreign_key "reviews", "scenes"
  add_foreign_key "reviews", "users"
  add_foreign_key "scenes", "movies"
  add_foreign_key "scenes", "places"
  add_foreign_key "scenes", "users"
end
