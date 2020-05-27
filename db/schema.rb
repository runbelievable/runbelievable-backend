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

ActiveRecord::Schema.define(version: 2020_05_21_213128) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "runs", force: :cascade do |t|
    t.float "distance"
    t.string "location"
    t.string "total_time"
    t.string "average_pace"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_runs", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "run_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["run_id"], name: "index_user_runs_on_run_id"
    t.index ["user_id"], name: "index_user_runs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "password_digest"
    t.string "age"
    t.string "gender"
    t.integer "max_run_distance"
    t.string "estimated_mile_pace"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "user_runs", "runs"
  add_foreign_key "user_runs", "users"
end
