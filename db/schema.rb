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

ActiveRecord::Schema.define(version: 20170620193335) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accommodation_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accommodations", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "image_url"
    t.boolean  "approved",              default: false
    t.integer  "place_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "user_id",                               null: false
    t.integer  "accommodation_type_id"
    t.index ["accommodation_type_id"], name: "index_accommodations_on_accommodation_type_id", using: :btree
    t.index ["place_id"], name: "index_accommodations_on_place_id", using: :btree
    t.index ["user_id"], name: "index_accommodations_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.text     "text"
    t.integer  "accommodation_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.index ["accommodation_id"], name: "index_comments_on_accommodation_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grades", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "comment_id"
    t.float    "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_grades_on_comment_id", using: :btree
    t.index ["user_id"], name: "index_grades_on_user_id", using: :btree
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_places_on_region_id", using: :btree
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_regions_on_country_id", using: :btree
  end

  create_table "room_reservations", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["room_id"], name: "index_room_reservations_on_room_id", using: :btree
    t.index ["user_id"], name: "index_room_reservations_on_user_id", using: :btree
  end

  create_table "rooms", force: :cascade do |t|
    t.integer  "room_number"
    t.integer  "bed_count"
    t.text     "description"
    t.float    "price_per_night"
    t.integer  "accommodation_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["accommodation_id"], name: "index_rooms_on_accommodation_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "type",                   default: "user"
    t.boolean  "blocked",                default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "accommodations", "accommodation_types"
  add_foreign_key "accommodations", "places"
  add_foreign_key "accommodations", "users"
  add_foreign_key "comments", "accommodations"
  add_foreign_key "comments", "users"
  add_foreign_key "grades", "comments"
  add_foreign_key "grades", "users"
  add_foreign_key "places", "regions"
  add_foreign_key "regions", "countries"
  add_foreign_key "room_reservations", "rooms"
  add_foreign_key "room_reservations", "users"
  add_foreign_key "rooms", "accommodations"
end
