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

ActiveRecord::Schema.define(version: 20160427075151) do

  create_table "features", force: :cascade do |t|
    t.string   "name"
    t.integer  "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hotels", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "description"
  end

  create_table "main_features", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "no_of_rooms"
    t.decimal  "total_price",    precision: 4, scale: 3
    t.decimal  "float_value",    precision: 4, scale: 3
    t.datetime "check_in_date"
    t.datetime "check_out_date"
    t.integer  "room_id"
    t.integer  "user_id"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.boolean  "cancel",                                 default: false
    t.integer  "guests"
  end

  create_table "room_images", force: :cascade do |t|
    t.integer  "room_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer  "room_no"
    t.integer  "rate"
    t.integer  "discount"
    t.boolean  "available"
    t.text     "description"
    t.integer  "total_beds"
    t.integer  "total_people"
    t.integer  "meal"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "hotel_id"
    t.float    "rate_after_disc"
    t.string   "title"
    t.string   "short_desc"
    t.text     "house_rules"
    t.text     "bus_train"
  end

  create_table "testimonials", force: :cascade do |t|
    t.string   "content"
    t.integer  "room_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "name"
    t.string   "user_type"
    t.string   "coupon"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
