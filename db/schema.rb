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

ActiveRecord::Schema.define(version: 20170331082050) do

  create_table "pull_notifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "pull_request_id"
    t.integer "chatwork_message_id"
    t.integer "action"
    t.integer "action_owner_id"
    t.boolean "replied"
    t.index ["pull_request_id"], name: "index_pull_notifications_on_pull_request_id", using: :btree
  end

  create_table "pull_requests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "url"
    t.text     "description",        limit: 65535
    t.integer  "user_room_id"
    t.string   "state"
    t.boolean  "merged"
    t.integer  "merged_by_id"
    t.integer  "reviewer_num"
    t.integer  "happy_reviewer_num"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "title"
    t.boolean  "deployed"
    t.index ["user_room_id"], name: "index_pull_requests_on_user_room_id", using: :btree
  end

  create_table "rooms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "chatwork_id"
    t.string   "name"
    t.string   "project_github_link"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "user_rooms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.integer  "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_user_rooms_on_room_id", using: :btree
    t.index ["user_id"], name: "index_user_rooms_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "github_id"
    t.string   "chatwork_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.string   "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "pull_notifications", "pull_requests"
  add_foreign_key "pull_requests", "user_rooms"
  add_foreign_key "user_rooms", "rooms"
  add_foreign_key "user_rooms", "users"
end
