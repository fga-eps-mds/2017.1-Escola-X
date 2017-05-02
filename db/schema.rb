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

ActiveRecord::Schema.define(version: 20170502134751) do

  create_table "alumns", force: :cascade do |t|
    t.integer  "registry"
    t.string   "shift"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
    t.index ["user_id"], name: "index_alumns_on_user_id"
  end

  create_table "employees", force: :cascade do |t|
    t.integer  "registry"
    t.string   "employee_cpf"
    t.string   "admission_date"
    t.string   "shift"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "parents", force: :cascade do |t|
    t.string   "parent_cpf"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_parents_on_user_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "cpfTeacher"
    t.date     "admissionDateTeacher"
    t.integer  "registerTeacher"
    t.string   "loginTeacher"
    t.string   "passowordTeacher"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "gender"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "password_digest"
    t.date     "birth_date"
    t.string   "authorization_token"
    t.string   "permission"
  end

end
