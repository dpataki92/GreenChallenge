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

ActiveRecord::Schema.define(version: 2020_07_12_153155) do

  create_table "challenges", force: :cascade do |t|
    t.string "title"
    t.string "description"
  end

  create_table "challenges_groups", id: false, force: :cascade do |t|
    t.integer "challenge_id", null: false
    t.integer "group_id", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "post_id"
    t.integer "user_id"
  end

  create_table "commitments", force: :cascade do |t|
    t.string "regularity"
    t.integer "challenge_id"
    t.integer "user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

  create_table "memberships", force: :cascade do |t|
    t.string "membership_type", default: "simple"
    t.integer "user_id"
    t.integer "group_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.integer "likes", default: 0
    t.integer "user_id"
    t.integer "group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "country"
    t.integer "points", default: 0
    t.string "avatar", default: "/images/avatar7.jpg"
    t.string "uid"
  end

end
