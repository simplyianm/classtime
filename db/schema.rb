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

ActiveRecord::Schema.define(version: 20150504224020) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "number"
    t.string   "section"
    t.string   "days"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "room"
    t.string   "instructor"
    t.date     "starts_at"
    t.date     "ends_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "credits"
    t.integer  "semester_id"
  end

  add_index "courses", ["semester_id"], name: "index_courses_on_semester_id", using: :btree

  create_table "courses_schedules", id: false, force: :cascade do |t|
    t.integer "schedule_id", null: false
    t.integer "course_id",   null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "semester_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "schedules", ["semester_id"], name: "index_schedules_on_semester_id", using: :btree
  add_index "schedules", ["user_id"], name: "index_schedules_on_user_id", using: :btree

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "semesters", force: :cascade do |t|
    t.string   "name"
    t.integer  "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "semesters", ["school_id"], name: "index_semesters_on_school_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "image"
    t.string   "token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
