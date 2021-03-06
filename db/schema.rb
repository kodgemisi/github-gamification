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

ActiveRecord::Schema.define(version: 20131109144115) do

  create_table "commit_files", force: true do |t|
    t.string   "filename"
    t.integer  "additions"
    t.integer  "deletions"
    t.integer  "changed_lines"
    t.integer  "commit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "commit_points", force: true do |t|
    t.integer  "commit_id"
    t.integer  "language_id"
    t.float    "point"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "commit_points", ["commit_id", "language_id"], name: "index_commit_points_on_commit_id_and_language_id"

  create_table "commits", force: true do |t|
    t.string   "sha"
    t.string   "url"
    t.string   "message"
    t.integer  "repo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "github_account_id"
  end

  create_table "github_accounts", force: true do |t|
    t.string   "login"
    t.string   "token"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "github_id"
    t.integer  "last_parsed_event_id"
    t.datetime "last_parsed_event_time"
  end

  create_table "languages", force: true do |t|
    t.string   "name"
    t.string   "extensions"
    t.float    "ratio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repos", force: true do |t|
    t.string   "name"
    t.string   "full_name"
    t.text     "description"
    t.string   "owner"
    t.integer  "github_account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "repo_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
