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

ActiveRecord::Schema.define(version: 20160204093954) do

  create_table "adresses", force: true do |t|
    t.string  "country"
    t.string  "state"
    t.string  "city"
    t.string  "street"
    t.integer "hotel_id"
  end

  create_table "hotels", force: true do |t|
    t.string   "title"
    t.text     "room_description"
    t.decimal  "price_for_room"
    t.boolean  "breakfast"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.text     "pictures"
    t.decimal  "average_raiting",  default: 0.0
  end

  create_table "raitings", force: true do |t|
    t.integer "user_id"
    t.integer "hotel_id"
    t.integer "value"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
