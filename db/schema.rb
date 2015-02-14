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

ActiveRecord::Schema.define(version: 20150214134030) do

  create_table "daily_plans", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "daily_plans_items", id: false, force: true do |t|
    t.integer "daily_plan_id"
    t.integer "item_id"
  end

  add_index "daily_plans_items", ["daily_plan_id"], name: "index_daily_plans_items_on_daily_plan_id"
  add_index "daily_plans_items", ["item_id"], name: "index_daily_plans_items_on_item_id"

  create_table "items", force: true do |t|
    t.string   "name"
    t.float    "calories"
    t.float    "protein"
    t.float    "fat"
    t.float    "unit_quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
