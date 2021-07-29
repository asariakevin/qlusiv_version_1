# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_24_072643) do

  create_table "artist_fans", force: :cascade do |t|
    t.integer "fan_id", null: false
    t.integer "artist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "artist_image_uri"
    t.integer "number_of_projects"
    t.integer "number_of_posts"
    t.integer "number_of_messages"
    t.string "artist_name"
    t.index ["artist_id"], name: "index_artist_fans_on_artist_id"
    t.index ["fan_id"], name: "index_artist_fans_on_fan_id"
  end

  create_table "artist_profiles", force: :cascade do |t|
    t.text "name"
    t.text "bio"
    t.text "city"
    t.text "image_url"
    t.integer "artist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_artist_profiles_on_artist_id"
  end

  create_table "artists", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fan_accounts", force: :cascade do |t|
    t.integer "balance"
    t.string "number"
    t.integer "fan_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fan_id"], name: "index_fan_accounts_on_fan_id"
  end

  create_table "fan_profiles", force: :cascade do |t|
    t.text "image_url"
    t.text "name"
    t.integer "fan_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fan_id"], name: "index_fan_profiles_on_fan_id"
  end

  create_table "fan_projects", force: :cascade do |t|
    t.integer "fan_id", null: false
    t.integer "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fan_id"], name: "index_fan_projects_on_fan_id"
    t.index ["project_id"], name: "index_fan_projects_on_project_id"
  end

  create_table "fans", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.text "caption"
    t.text "image_url"
    t.text "video_url"
    t.integer "like"
    t.integer "artist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_posts_on_artist_id"
  end

  create_table "projects", force: :cascade do |t|
    t.text "title"
    t.integer "support"
    t.integer "supports"
    t.integer "plays"
    t.integer "likes"
    t.text "video_url"
    t.integer "artist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_projects_on_artist_id"
  end

  add_foreign_key "artist_fans", "artists"
  add_foreign_key "artist_fans", "fans"
  add_foreign_key "artist_profiles", "artists"
  add_foreign_key "fan_accounts", "fans"
  add_foreign_key "fan_profiles", "fans"
  add_foreign_key "fan_projects", "fans"
  add_foreign_key "fan_projects", "projects"
  add_foreign_key "posts", "artists"
  add_foreign_key "projects", "artists"
end
