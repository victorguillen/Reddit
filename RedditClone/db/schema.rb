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

ActiveRecord::Schema.define(version: 20161209214001) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "body",              null: false
    t.integer  "parent_comment_id"
    t.integer  "post_id",           null: false
    t.integer  "user_id",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_subs", force: :cascade do |t|
    t.integer  "post_id",    null: false
    t.integer  "sub_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "url"
    t.text     "content"
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subs", force: :cascade do |t|
    t.string   "name",         null: false
    t.integer  "moderator_id", null: false
    t.text     "description",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subs", ["name"], name: "index_subs_on_name", unique: true, using: :btree

  create_table "user_votes", force: :cascade do |t|
    t.integer  "user_id",      null: false
    t.integer  "value",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "votable_id",   null: false
    t.string   "votable_type", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["name"], name: "index_users_on_name", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree

end
