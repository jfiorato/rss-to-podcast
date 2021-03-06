# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170809135113) do

  create_table "feeds", force: :cascade do |t|
    t.integer  "user_id",    limit: 4,   null: false
    t.string   "url",        limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "feed_id",         limit: 4,     null: false
    t.string   "entry_id",        limit: 255,   null: false
    t.string   "title",           limit: 255
    t.text     "content",         limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "audio_url",       limit: 255
    t.integer  "audio_file_size", limit: 4
  end

  add_index "posts", ["feed_id", "entry_id"], name: "index_posts_on_feed_id_and_entry_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "user_cookie", limit: 255, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

end
