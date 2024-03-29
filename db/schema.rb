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

ActiveRecord::Schema.define(version: 20150713132801) do

  create_table "designations", force: :cascade do |t|
    t.string   "designation_name", limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "designation_id",         limit: 4
    t.string   "first_name",             limit: 255
    t.string   "middle_name",            limit: 255
    t.string   "last_name",              limit: 255
    t.string   "email",                  limit: 255
    t.string   "login_id",               limit: 255
    t.string   "employee_id",            limit: 255
    t.date     "date_of_birth"
    t.string   "gender",                 limit: 255
    t.string   "time_zone",              limit: 255
    t.date     "date_of_joining"
    t.text     "education",              limit: 65535
    t.text     "comments",               limit: 65535
    t.boolean  "is_locked"
    t.boolean  "is_active"
    t.date     "deactivated_on"
    t.text     "reason",                 limit: 65535
    t.string   "work_phone",             limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "role_id",                limit: 4
  end

  add_index "users", ["designation_id"], name: "index_users_on_designation_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  add_foreign_key "users", "roles"
end
