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

ActiveRecord::Schema.define(version: 20190406025015) do

  create_table "attendances", force: :cascade do |t|
    t.date "worked_on"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.string "note"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "scheduled_end_time"
    t.string "processing_content"
    t.integer "instructor_confirm_overtime"
    t.integer "to_user_overtime"
    t.boolean "next_day"
    t.string "note_chenging"
    t.integer "instructor_confirma_chenging"
    t.date "approval_date"
    t.integer "to_user_chenge"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "overtimes", force: :cascade do |t|
    t.datetime "scheduled_end_time"
    t.string "processing_content"
    t.string "Instructor_confirmation"
    t.integer "to_user"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_overtimes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
    t.string "department"
    t.datetime "basic_time", default: "2019-02-19 22:30:00"
    t.datetime "work_time", default: "2019-02-19 23:00:00"
    t.integer "employee_number"
    t.string "uid"
    t.boolean "superior"
    t.datetime "designated_work_start_time"
    t.datetime "designated_work_end_time"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
