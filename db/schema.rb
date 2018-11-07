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

ActiveRecord::Schema.define(version: 2018_11_06_232332) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abuses", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "sound_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sound_id"], name: "index_abuses_on_sound_id"
    t.index ["user_id"], name: "index_abuses_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "sound_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sound_id"], name: "index_likes_on_sound_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "logs", force: :cascade do |t|
    t.string "device"
    t.string "device_string"
    t.string "os"
    t.string "uid"
    t.string "version"
    t.string "build"
    t.string "device_name"
    t.string "device_system_name"
    t.string "device_version"
    t.string "device_model"
    t.string "device_localized_model"
    t.string "device_screen_bounds"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string "filename"
    t.bigint "user_id"
    t.bigint "sound_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sound_id"], name: "index_photos_on_sound_id"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "sound_logs", force: :cascade do |t|
    t.string "device_type"
    t.string "os"
    t.string "version"
    t.string "build"
    t.string "device_name"
    t.string "device_system_name"
    t.string "device_version"
    t.string "device_model"
    t.string "device_localized_model"
    t.bigint "user_id"
    t.bigint "sound_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sound_id"], name: "index_sound_logs_on_sound_id"
    t.index ["user_id"], name: "index_sound_logs_on_user_id"
  end

  create_table "sounds", force: :cascade do |t|
    t.string "description"
    t.float "longitude"
    t.float "latitude"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "commons", default: true, null: false
    t.boolean "public", default: false, null: false
    t.boolean "finished", default: false, null: false
    t.string "placement_location"
    t.string "placement_name"
    t.string "placement_address_dictionary"
    t.string "placement_iso_country_code"
    t.string "placement_country"
    t.string "placement_postal_code"
    t.string "placement_administrative_area"
    t.string "placement_sub_administrative_area"
    t.string "placement_locality"
    t.string "placement_sub_locality"
    t.string "placement_thoroughfare"
    t.string "placement_sub_thoroughfare"
    t.string "placement_region"
    t.string "placement_inland_water"
    t.string "placement_ocean"
    t.string "placement_areas_of_interest"
    t.boolean "abuse", default: false, null: false
    t.string "device_name"
    t.string "device_system_name"
    t.string "device_version"
    t.string "device_model"
    t.string "device_localized_model"
    t.string "device_screen_bounds"
    t.integer "plays", default: 0, null: false
    t.index ["public"], name: "index_sounds_on_public"
    t.index ["user_id"], name: "index_sounds_on_user_id"
  end

  create_table "user_devices", force: :cascade do |t|
    t.string "device_key"
    t.string "device"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_devices_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "bio"
    t.string "url"
    t.string "twitter"
    t.string "portrait"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "abuses", "sounds"
  add_foreign_key "abuses", "users"
  add_foreign_key "likes", "sounds"
  add_foreign_key "likes", "users"
  add_foreign_key "photos", "sounds"
  add_foreign_key "photos", "users"
  add_foreign_key "sound_logs", "sounds"
  add_foreign_key "sound_logs", "users"
  add_foreign_key "sounds", "users"
  add_foreign_key "user_devices", "users"
end
