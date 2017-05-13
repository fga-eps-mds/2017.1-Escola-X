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


ActiveRecord::Schema.define(version: 20170509124752) do

  create_table "alumns", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "gender"
    t.date     "birth_date"
    t.string   "bar_code"
    t.string   "registry"
    t.string   "password_digest"
    t.string   "authorization_token"
    t.string   "shift"
    t.integer  "quantity_strike"
    t.integer  "parent_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["parent_id"], name: "index_alumns_on_parent_id"
  end

  create_table "classrooms", force: :cascade do |t|
    t.string   "name_classroom"
    t.string   "shift_classroom"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "employees", force: :cascade do |t|
    t.integer  "registry"
    t.string   "employee_cpf"
    t.string   "admission_date"
    t.string   "shift"
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "gender"
    t.string   "birth_date"
    t.string   "permission"
    t.string   "password_digest"
    t.string   "authorization_token"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "grades", force: :cascade do |t|
    t.float    "grade_01"
    t.float    "grade_02"
    t.float    "grade03"
    t.float    "grade04"
    t.float    "grade_final"
    t.integer  "alumn_id"
    t.integer  "subject_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["alumn_id"], name: "index_grades_on_alumn_id"
    t.index ["subject_id"], name: "index_grades_on_subject_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "title"
    t.text     "notification_text"
    t.integer  "notification_emitter_id"
    t.date     "notification_date"
    t.time     "notification_hour"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "motive"
    t.index ["notification_emitter_id"], name: "index_notifications_on_notification_emitter_id"
  end

  create_table "parents", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "gender"
    t.string   "password_digest"
    t.string   "authorization_token"
    t.date     "birth_date"
    t.string   "parent_cpf"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "school_misses", force: :cascade do |t|
    t.integer  "alumn_id"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alumn_id"], name: "index_school_misses_on_alumn_id"
  end

  create_table "strikes", force: :cascade do |t|
    t.string   "description_strike"
    t.date     "date_strike"
    t.integer  "alumn_id"
    t.integer  "employee_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["alumn_id"], name: "index_strikes_on_alumn_id"
    t.index ["employee_id"], name: "index_strikes_on_employee_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name_subject"
    t.string   "class_level"
    t.integer  "teacher_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["teacher_id"], name: "index_subjects_on_teacher_id"
  end

end
