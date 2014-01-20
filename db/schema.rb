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

ActiveRecord::Schema.define(version: 20140110205145) do

  create_table "charges", id: false, force: true do |t|
    t.string   "id",              null: false
    t.boolean  "livemode"
    t.datetime "created_at"
    t.string   "status"
    t.string   "currency"
    t.text     "description"
    t.string   "reference_id"
    t.string   "failure_code"
    t.string   "failure_message"
    t.float    "amount"
    t.string   "card_name"
    t.string   "card_exp_month"
    t.string   "card_exp_year"
    t.string   "card_auth_code"
    t.string   "card_last4"
    t.string   "card_brand"
    t.datetime "updated_at"
  end

  create_table "events", id: false, force: true do |t|
    t.string   "id",         null: false
    t.string   "type"
    t.datetime "created_at"
    t.string   "charge_id"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "price"
    t.boolean  "is_subscription"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
