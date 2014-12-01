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

ActiveRecord::Schema.define(version: 20141121124748) do

  create_table "budgets", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "is_expense"
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "amount",      limit: 24
  end

  add_index "budgets", ["category_id"], name: "index_budgets_on_category_id", using: :btree
  add_index "budgets", ["user_id"], name: "index_budgets_on_user_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.boolean  "is_active"
    t.boolean  "is_blocked"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",      default: false
  end

  add_foreign_key "budgets", "categories", name: "budgets_category_id_fk"
  add_foreign_key "budgets", "users", name: "budgets_user_id_fk"

end
